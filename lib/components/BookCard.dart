import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../classes/Book.dart';
import '../pages/BookPage.dart';

class BookCard extends StatefulWidget {
  final Book book;
  const BookCard({required this.book, Key? key}) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  void goToBook() {
    Navigator.push(
        context, (MaterialPageRoute(builder: (context) => BookPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.book.title),
          TextButton(onPressed: goToBook, child: Text("Click"))
        ],
      ),
    );
  }
}
