import 'package:flutter/material.dart';

class PersistentPage extends StatefulWidget {
  const PersistentPage({super.key});

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
        title: const Text('Persistent Page'),
      ),
      body: PageStorage(
        // Wrap your PageView with PageStorage
        child: PageView(
          children: const [
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
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page One'),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page Two'),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page Three'),
    );
  }
}
