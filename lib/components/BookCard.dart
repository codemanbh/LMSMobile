import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_managment_system_mobile/server/serverInfo.dart';
import '../classes/Book.dart';
import '../pages/BookPage.dart';

class BookCard extends StatefulWidget {
  final Book book;
  const BookCard({required this.book, super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  // final GlobalKey _key = GlobalKey();

  void goToBook() {
    Navigator.pushNamed(context, '/book', arguments: {'book': widget.book});
  }

  // String server = "http://127.0.0.1:8000/storage/"; // remove later

  Widget Img() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network("${SERVER_LINK}/storage/${widget.book.image_url}",
            width: 150,

            // height: 200,

            fit: BoxFit.cover),
      ),
    );
  }

  Widget RightSection() {
    TextStyle titleStyle() {
      return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    }

    Widget title() {
      return Text(
        widget.book.title,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: titleStyle(),
      );
    }

    Widget description() {
      return Text(
        widget.book.description,
        maxLines: 4,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      );
    }

    Widget detailBtn() {
      return IconButton(onPressed: goToBook, icon: const Icon(Icons.book));
    }

    return
        // Flexible(
        // child:
        Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [title(), description(), detailBtn()],
          // ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Img(), RightSection()],
        ),
      ),
    );
  }
}
