import 'package:flutter/material.dart';
import '../classes/Book.dart';

class ReserveBTN extends StatelessWidget {
  final Book book;
  const ReserveBTN({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    void _goToReservePage() {
      print('attempting to navigate');
      Navigator.pushNamed(context, '/reserve', arguments: {'book': book});
    }

    return ElevatedButton(onPressed: _goToReservePage, child: Text("Reserve"));
  }
}
