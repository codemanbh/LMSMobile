import 'package:flutter/material.dart';
import '../components/Nav.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextStyle labelStyle() {
    return const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  }

  TextStyle valueStyle() {
    return TextStyle(fontSize: 21, fontWeight: FontWeight.normal);
  }

  Future<void> _handleRefresh() async {
    print('Refresh');
  }

  Widget _buidNameSecion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: labelStyle(),
        ),
        Text(
          "John Doe",
          style: valueStyle(),
        ),
      ],
    );
  }

  Widget _buidEmailSecion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: labelStyle(),
        ),
        Text(
          "JohnDoe@gmail.com",
          style: valueStyle(),
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: CircleAvatar(
        radius: 80,
        child: Image.network(
          'https://avatar.iran.liara.run/public/1',
        ),
      ),
    );
  }

  Widget _buildLogoutBtn() {
    void _handleLogout() {}
    return ElevatedButton.icon(
        onPressed: _handleLogout,
        icon: Icon(Icons.logout),
        label: Text("Logout"));
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildLoginBtn() {
      void _handleLogin() {
        Navigator.pushNamed(context, '/login');
      }

      return ElevatedButton.icon(
          onPressed: _handleLogin,
          icon: Icon(Icons.logout),
          label: Text("Login"));
    }

    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildAvatar(),
              _buidNameSecion(),
              const SizedBox(height: 30),
              _buidEmailSecion(),
              const SizedBox(height: 30),
              _buildLoginBtn(),
              _buildLogoutBtn()
            ]),
          ),
        ),
      ),
    );
  }
}
