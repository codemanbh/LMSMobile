import 'package:flutter/material.dart';
import '../components/Nav.dart';

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
    return const TextStyle(fontSize: 21, fontWeight: FontWeight.normal);
  }

  Future<void> _handleRefresh() async {
    print('Refresh');
    // setState(() {
    // books.removeAt(0);
    // });
    // fetchData();
    // return null;
  }

  List ran = List.generate(100, (index) => Text(index.toString()));

  @override
  Widget build(BuildContext context) {
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
              Center(
                child: CircleAvatar(
                  radius: 80,
                  child: Image.network(
                    'https://avatar.iran.liara.run/public/1',
                  ),
                ),
              ),
              Text(
                "Name",
                style: labelStyle(),
              ),
              Text(
                "John Doe",
                style: valueStyle(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Email",
                style: labelStyle(),
              ),
              Text(
                "JohnDoe@gmail.com",
                style: valueStyle(),
              ),
              ...ran
            ]),
          ),
        ),
        // bottomNavigationBar: Nav(),
      ),
    );
  }
}
