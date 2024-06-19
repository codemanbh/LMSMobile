import 'package:flutter/material.dart';
import '../server/serverInfo.dart';
import '../components/ReserveBTN.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ??
            {};

    Widget _buildBookImage() {
      return Center(
        child: Image.network(
          "${SERVER_LINK}/storage/${data['book'].image_url}",
          width: 280,
        ),
      );
    }

    Widget _buildTitle() {
      return Text(
        data['book'].title,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      );
    }

    ;

    Widget _buildDescription() {
      return Text(
        data['book'].description,
        style: TextStyle(fontSize: 20),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(data['book'].title)),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildBookImage(),
            SizedBox(height: 30),
            _buildTitle(),
            _buildDescription(),
            ReserveBTN(book: data['book'])
          ]),
        ),
      ),
    );
  }
}
