import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/BookCard.dart';
import '../classes/Book.dart';
import '../server/serverInfo.dart';
import '../components/Nav.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List books = [];

  void fetchData() async {
    try {
      var url = Uri.parse('$SERVER_LINK/api/books');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          books = jsonDecode(response.body);
        });
      } else {}
    } catch (e) {
      print(e);
    }
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

    return SizedBox(
      width: double.infinity,
      child: Column(
        // backgroundColor:Colors.red,
        children: mapBookList(),
      ),
    );
  }

  Widget loudButton() {
    return TextButton(
      child: const Text("Loud Books"),
      onPressed: () {
        fetchData();
        // print(books);
      },
    );
  }

  Future<void> _handleRefresh() async {
    print('Refresh');
    // setState(() {
    // books.removeAt(0);
    // });
    fetchData();
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget loud() {
      return Center(
        child: SpinKitDoubleBounce(
          color: Theme.of(context).colorScheme.secondary,
          size: 50.0,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: books.isEmpty
          ? loud()
          : RefreshIndicator(
              onRefresh: _handleRefresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    bookList(),
                  ],
                ),
              ),
            ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text("Books"),
    //   ),
    //   // bottomNavigationBar: Nav(),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         books.isEmpty ? const Text('asfasd') : bookList(),
    //         loudButton()
    //       ],
    //     ),
    //   ),
    // );
  }
}
