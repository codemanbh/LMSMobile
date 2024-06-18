library navigation;

import 'package:flutter/material.dart';
import '../pages/ProfilePage.dart';
import '../pages/HomePage.dart';
import '../pages/BookPage.dart';
import '../pages/LoginPage.dart';

final List<Widget> _pages = [
  const Home(),
  const Profile(),
  const BookPage(),
  const LoginPage(),
  // ThirdPage(),
];
final _titles = ["Home", "Profile", "Book", "Login"];
