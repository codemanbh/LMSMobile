// import 'dart:js';

import 'package:flutter/material.dart';

// Classes
// Pages
import 'pages/ProfilePage.dart';
import 'pages/HomePage.dart';
import 'pages/BookPage.dart';
import 'pages/LoginPage.dart';

// Components
import 'components/CustomAppBar.dart';
import 'components/Nav.dart';

void main() {
  runApp(MaterialApp(
    // home: const App(),
    // initialRoute: '/books',
    debugShowCheckedModeBanner: false,
    home: App(),
    routes: {
      '/books': (context) => Home(),
      '/profile': (context) => Profile(),
      '/book': (context) => BookPage()
    },
    theme: ThemeData.dark(),
  ));

  // doWhenWindowReady(() {
  //   const initialSize = Size(600, 450);
  //   appWindow.minSize = initialSize;
  //   // appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.center;
  //   appWindow.show();
  // });
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _pageIndex = 0;

  Widget home = Home();
  Widget profile = Profile();
  // final List<Widget> _pages = [home, Profile()];

  void setPageIndex(int newIndex) {
    // _pages[newIndex]['offstage'] = false;
    setState(() {
      _pageIndex = newIndex;
    });
  }

  // final _titles = ["Home", "Profile", "Book", "Login"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: [home, profile][_pageIndex],
      bottomNavigationBar:
          Nav(pageIndex: _pageIndex, setPageIndex: setPageIndex),
    );
  }

  // Widget customPageView() {
  //   return PageView(
  //     controller: _pageController,
  //     children: _pages,
  //     // allowImplicitScrolling: true
  //   );
  // }
}
