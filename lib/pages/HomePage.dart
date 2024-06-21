import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/BookCard.dart';
import '../classes/Book.dart';
import '../server/serverInfo.dart';
import '../components/Nav.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/CategoriesSelection.dart';
import '../components/BooksAppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List books = [];

  void fetchData(String urlLink) async {
    print(urlLink);
    try {
      var url = Uri.parse(urlLink);
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
    fetchData('$SERVER_LINK/api/books');
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
        children: mapBookList(),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    fetchData('$SERVER_LINK/api/books');
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

    void p() {}
    return Scaffold(
      // appBar: BooksAppBar(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [BooksAppBar(fetchData: fetchData)],
        body: Container(
          child: books.isEmpty
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
        ),
      ),
    );
  }
}
