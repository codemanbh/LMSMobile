import 'dart:convert';
// import 'dart:html';
// import 'dart:js_util';

import 'package:flutter/material.dart';
import '../server/serverInfo.dart';
import 'package:http/http.dart' as http;

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
    print('submitted');
    Uri url = Uri.parse('$SERVER_LINK/api/books');
    var response = await http.get(url);

    // http.get();
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
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
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
      )),
    );
  }
}
