// import 'dart:js';

import 'package:flutter/material.dart';

// Classes
// Pages

// Components
import 'components/CustomAppBar.dart';
import 'components/Nav.dart';
import 'components/Pages.dart';

void main() {
  runApp(MaterialApp(
    // home: const App(),
    // initialRoute: '/books',
    debugShowCheckedModeBanner: false,
    home: App(),
    routes: routes,
    theme: ThemeData.dark(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _pageIndex = 0;

  // final List<Widget> _pages = [Home(), Profile()];

  void setPageIndex(int newIndex) {
    setState(() {
      _pageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar:
          Nav(pageIndex: _pageIndex, setPageIndex: setPageIndex),
    );
  }
}
