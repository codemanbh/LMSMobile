import 'package:flutter/material.dart';
import '../context/provider.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ProviderModel>(
      builder: (context, value, child) => Column(children: [
        const Text("Book page"),
        TextButton(onPressed: value.toToPrevPage, child: const Text("return"))
      ]),
    );
  }
}
