import 'package:flutter/material.dart';

class PersistentPage extends StatefulWidget {
  @override
  _PersistentPageState createState() => _PersistentPageState();
}

class _PersistentPageState extends State<PersistentPage>
    with AutomaticKeepAliveClientMixin {
  // Required override for AutomaticKeepAliveClientMixin
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure super.build is called

    return Scaffold(
      appBar: AppBar(
        title: Text('Persistent Page'),
      ),
      body: PageStorage(
        // Wrap your PageView with PageStorage
        child: PageView(
          children: [
            PageOne(), // Example page widgets
            PageTwo(),
            PageThree(),
          ],
        ),
      ),
    );
  }
}

// Example Page Widgets
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page One'),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Two'),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Three'),
    );
  }
}
