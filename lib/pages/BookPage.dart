import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  void returnPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Book page"),
      TextButton(onPressed: returnPage, child: const Text("return"))
    ]);
  }
}
