import 'package:flutter/material.dart';
import '../server/serverInfo.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ProviderModel extends ChangeNotifier {
  @override
  int _count = 0;
  int get count => _count;
  var _books = [];
  dynamic get books => books;

  void fetchData(BuildContext context) async {
    try {
      var url = Uri.parse('$SERVER_LINK/api/books');
      var response = await http.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        _books = jsonDecode(response.body);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  void setBooks(dynamic newBooks) {
    _books = newBooks;
  }

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  void add() {
    _count++;
    notifyListeners();
  }

  void toToPrevPage() {
    _pageController.jumpToPage(0);
  }
}
