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
    home: const App(),
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
  int pageIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const Home(),
    const Profile(),
    const BookPage(),
    const LoginPage(),

    // ThirdPage(),
  ];
  final _titles = ["Home", "Profile", "Book", "Login"];

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
      // WindowTitleBarBox(child: MoveWindow()),

      bottomNavigationBar: Nav(currentIndex: pageIndex, navigate: navigate),
    );
  }

  Widget customPageView() {
    return PageView(
      controller: _pageController,
      children: _pages,
      // allowImplicitScrolling: true
    );
  }
}
