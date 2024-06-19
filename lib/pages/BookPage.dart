import 'package:flutter/material.dart';
import '../server/serverInfo.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  void returnPage() {
    Navigator.pop(context);
  }

  // final Map data = {};
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ??
            {};

    return Scaffold(
      appBar: AppBar(title: Text(data['book'].title)),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Image.network(
                "${SERVER_LINK}/storage/${data['book'].image_url}",
                width: 280,
              ),
            ),
            SizedBox(height: 30),
            Text(
              data['book'].title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              data['book'].description,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () => {print('a')}, child: Text("Borrow"))
          ]),
        ),
      ),
    );
  }
}
