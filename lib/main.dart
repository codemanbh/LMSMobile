import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Quote.dart';
import 'QueteCard.dart';
import 'pages/ProfilePage.dart';
import 'pages/HomePage.dart';

import 'components/CustomAppBar.dart';

import 'components/Nav.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int pageIndex = 0;

  void navigate(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
  }

  var _titles = ["Home", "Profile" , "Book"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _titles[pageIndex]),
      body: [Home(), Profile()][pageIndex],
      bottomNavigationBar: Nav(currentIndex: pageIndex, navigate: navigate),
    );
  }
}
