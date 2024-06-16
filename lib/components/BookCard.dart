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

  String server = "http://127.0.0.1:8000/storage/"; // remove later

  Widget Img() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(server + widget.book.image_url,
          width: 150,
          // height: 200,

          fit: BoxFit.cover),
    );
  }

  Widget LeftSection() {
    TextStyle titleStyle() {
      return TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    }

    return Flexible(
      child: Expanded(
        child: Container(
          // constraints: BoxConstraints.expand(),
          // color: Colors.red,
          // height: double.infinity,
          margin: EdgeInsets.all(10),
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.book.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: titleStyle(),
              ),
              Text(
                widget.book.description,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(onPressed: goToBook, icon: Icon(Icons.book))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Img(), LeftSection()],
          ),
        ),
      ),
    );
  }
}
