// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'context/provider.dart';
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
  runApp(ChangeNotifierProvider(
    create: (context) => ProviderModel(),
    child: MaterialApp(
      home: const App(),
      theme: ThemeData.dark(),
    ),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int pageIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Profile(),
    const BookPage(),
    const LoginPage(),
    // ThirdPage(),
  ];
  final _titles = ["Home", "Profile", "Book", "Login"];

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ProviderModel>(context).pageController;
    void navigate(int newIndex) {
      setState(() {
        pageIndex = newIndex;
      });
      pageController.jumpToPage(newIndex);
    }

    return Consumer<ProviderModel>(
      builder: (context, value, child) => Scaffold(
        appBar: CustomAppBar(title: _titles[pageIndex]),
        body: PageView(
          controller: pageController,
          children: _pages,
          // allowImplicitScrolling: true
        ),

        // WindowTitleBarBox(child: MoveWindow()),

        bottomNavigationBar: Nav(currentIndex: pageIndex, navigate: navigate),
      ),
    );
  }

  // Widget customPageView() {
  //   return;
  // }
}
