// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Classes
// Pages

// Components
import 'components/CustomAppBar.dart';
import 'components/Nav.dart';
import 'components/Pages.dart';
import 'context/Theme.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _pageIndex = 0;

  void setPageIndex(int newIndex) {
    setState(() {
      _pageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildAppScaffold() {
      return Scaffold(
        body: pages[_pageIndex],
        bottomNavigationBar:
            Nav(pageIndex: _pageIndex, setPageIndex: setPageIndex),
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _buildAppScaffold(),
        routes: routes,
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme(),
        theme: lightTheme());
  }
}
