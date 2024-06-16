import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/BookCard.dart';
import '../classes/Book.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var books = [];
  String server = "http://127.0.0.1:8000"; // remove later

  void fetchData() async {
    var url = Uri.parse('$server/api/books');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        books = jsonDecode(response.body);
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget bookList() {
    List<Widget> mapBookList() {
      return books
          .map(
            (b) => BookCard(
                book: Book(
                    title: b['title'],
                    image_url: b['image_url'],
                    description: b['description'])),
          )
          .toList();
    }

    return Container(
      width: double.infinity,
      child: Column(
        // backgroundColor:Colors.red,
        children: mapBookList(),
      ),
    );
  }

  Widget loudButton() {
    return TextButton(
      child: Text("Loud Books"),
      onPressed: () {
        fetchData();
        print(books);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [books.isEmpty ? Text('louding') : bookList()],
      ),
    );
  }
}
