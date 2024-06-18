import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/material.dart';
import '../server/serverInfo.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  String fstate = "not logged in";

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      onSaved: (String? value) {
        _email = value ?? "";
      },
      validator: (String? value) {
        String v = value ?? "";
        if (v.isEmpty) {
          return "Email is required";
        }
        return null;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      onSaved: (String? value) {
        _password = value ?? "";
      },
      validator: (String? value) {
        String v = value ?? "";
        if (v.isEmpty) {
          return "Password is required";
        }
        return null;
      },
    );
  }

  void login() async {
    try {
      final Dio dio = Dio(BaseOptions(
        // baseUrl: SERVER_LINK,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ));

      // Retrieve CSRF token
      final csrfResponse = await dio.get('$SERVER_LINK/api/token');
      final csrfToken = csrfResponse.data['csrf_token'];
      final cookies = csrfResponse.headers['set-cookie'];
      // Set CSRF token in headers for subsequent requests
      dio.options.headers['X-CSRF-TOKEN'] = csrfToken;
      dio.options.headers['Cookie'] = cookies;
      // Prepare login data
      final Map<String, dynamic> loginData = {
        'email': _email,
        'password': _password,
      };

      // Make POST request to login endpoint
      final response = await dio.post(
        '$SERVER_LINK/api/login',
        data: jsonEncode(loginData),
      );

      // Handle response
      print(response.data); // Print the response data for debugging

      // Example of handling state in a Flutter widget
      // Replace with your actual state management approach
      setState(() {
        fstate = "sent";
      });

      if (response.statusCode == 200) {
        // Handle successful login
        setState(() {
          fstate = "logged in";
        });
      } else {
        // Handle unsuccessful login
        setState(() {
          fstate = "not logged in";
        });
      }
    } catch (e) {
      // Handle any exceptions
      print('Exception during login: $e');
      setState(() {
        fstate = "error";
      });
    }
  }

  Widget _buildSubmitBtn() {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
            login();
          } else {
            return;
          }
        },
        child: const Text("Submit"));
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmail(),
          _buildPassword(),
          const SizedBox(height: 30),
          _buildSubmitBtn()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fstate),
          _buildForm(),
        ],
      ),
    ));
  }
}
