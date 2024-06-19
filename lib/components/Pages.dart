import 'package:flutter/material.dart';

import '../pages/ProfilePage.dart';
import '../pages/HomePage.dart';
import '../pages/BookPage.dart';
import '../pages/LoginPage.dart';
import '../pages/ReservePage.dart';
import '../pages/HistoryPage.dart';

var routes = {
  '/books': (context) => Home(),
  '/profile': (context) => Profile(),
  '/book': (context) => BookPage(),
  '/reserve': (context) => ReservePage(),
  '/login': (context) => LoginPage(),
  '/history': (context) => HistoryPage()
};

final List<Widget> pages = [Home(), Profile(), HistoryPage()];
      // final _titles = ["Home", "Profile", "Book", "Login"];