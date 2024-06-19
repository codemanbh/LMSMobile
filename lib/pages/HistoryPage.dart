import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> things = List.generate(
        10,
        (i) => Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Container(
                    padding: EdgeInsets.all(20), child: Text(i.toString())),
              ),
            ));
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Container(
          // color: Colors.red[600],
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [...things],
            ),
          )),
    );
  }
}
