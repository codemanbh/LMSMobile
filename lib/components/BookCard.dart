import 'package:flutter/material.dart';
import 'package:library_managment_system_mobile/server/serverInfo.dart';
import '../classes/Book.dart';
import '../pages/BookPage.dart';
import '../server/serverInfo.dart';
import '../context/provider.dart';
import 'package:provider/provider.dart';

class BookCard extends StatefulWidget {
  final Book book;
  const BookCard({required this.book, super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  void goToBook() {
    Navigator.push(
        context, (MaterialPageRoute(builder: (context) => const BookPage())));
  }

  // String server = "http://127.0.0.1:8000/storage/"; // remove later

  Widget Img() {
    String fullImgLink = "$SERVER_LINK/storage/${widget.book.image_url}";
    print(fullImgLink);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(fullImgLink,
          width: 150,
          // height: 200,

          fit: BoxFit.cover),
    );
  }

  Widget LeftSection() {
    TextStyle titleStyle() {
      return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    }

    return Consumer<ProviderModel>(
      builder: (context, value, child) => Flexible(
        child: Expanded(
          child: Container(
            // constraints: BoxConstraints.expand(),
            // color: Colors.red,
            // height: double.infinity,
            margin: const EdgeInsets.all(10),
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
                IconButton(
                    onPressed: () {
                      value.pageController.jumpToPage(2);
                    },
                    icon: const Icon(Icons.book))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ProviderModel>(context).pageController;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Img(), LeftSection()],
          ),
        ),
      ),
    );
  }
}
