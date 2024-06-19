import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nav extends StatefulWidget {
  // ValueChanged<int>  = (){} ;

  final int pageIndex;
  final ValueChanged<int> setPageIndex;
// required this.navigate, required this.currentIndex,
  // const Nav({super.key});

  // final int currentIndex;
  // final ValueChanged<int> navigate;

  const Nav({
    required this.pageIndex,
    required this.setPageIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  // int currentDestinationIndex = 0;

  // widget.navigate(1);
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        selectedIndex: widget.pageIndex,
        onDestinationSelected: (i) => {widget.setPageIndex(i)});
  }
}
