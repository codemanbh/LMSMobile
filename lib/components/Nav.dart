import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nav extends StatefulWidget {
  // ValueChanged<int>  = (){} ;

  final int currentIndex;
  final ValueChanged<int> navigate;

  const Nav({required this.navigate, required this.currentIndex, Key? key})
      : super(key: key);

  // final int currentIndex;
  // final ValueChanged<int> navigate;

  // const Nav({
  //   required this.currentIndex,
  //   required this.navigate,
  //   Key? key,
  // }) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentDestinationIndex = 0;

  // widget.navigate(1);
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        selectedIndex: widget.currentIndex,
        onDestinationSelected: (i) => {widget.navigate(i)});
  }
}
