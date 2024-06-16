import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Quote.dart';
import 'QueteCard.dart';
import 'pages/ProfilePage.dart';
import 'pages/HomePage.dart';
import 'pages/BookPage.dart';
import 'pages/LoginPage.dart';
import 'components/CustomAppBar.dart';
import 'components/Nav.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    theme: ThemeData.dark(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int pageIndex = 0;
  PageController _pageController = PageController();

  List<Widget> _pages = [
    Home(),
    Profile(),
    BookPage(),
    LoginPage(),

    // ThirdPage(),
  ];
  var _titles = ["Home", "Profile", "Book", "Login"];

  void navigate(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
    _pageController.jumpToPage(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _titles[pageIndex]),
      body: customPageView(),
      bottomNavigationBar: Nav(currentIndex: pageIndex, navigate: navigate),
    );
  }

  Widget customPageView() {
    return PageView(
        controller: _pageController,
        children: _pages,
        allowImplicitScrolling: true);
  }
}
