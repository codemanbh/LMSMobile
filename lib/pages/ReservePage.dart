// import 'dart:js';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  String dueDateString = "";

  @override
  void initState() {
    super.initState();
    DateTime midDate = DateTime.now().add(const Duration(days: 30));
    dueDateString = "Due date: ${midDate.day}/${midDate.month}/${midDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ??
            {};

    DateTime today = DateTime.now();
    DateTime minDate = today.add(const Duration(days: 3));
    DateTime midDate = today.add(const Duration(days: 30));
    DateTime maxDate = today.add(const Duration(days: 60));
    DateTime? dueDate = midDate;
    DateTime? tempDate = midDate;

    void convertDateToString() {
      setState(() {
        dueDateString =
            "Due date: ${dueDate?.day}/${dueDate?.month}/${dueDate?.year}";
      });
    }

    Widget _buildSelectDateButton() {
      void handeDateSelection() async {
        // print('reserve');
        tempDate = await showDatePicker(
            context: context,
            initialDate: midDate,
            firstDate: minDate,
            lastDate: maxDate);
        setState(() {
          dueDate = tempDate;
        });
        convertDateToString();
        print(dueDate);
      }

      return ElevatedButton(
          onPressed: handeDateSelection, child: const Text("Change due date"));
    }

    Widget _buildBookTitle() {
      return Text(
        data['book'].title,
        style: const TextStyle(fontSize: 30),
      );
    }

    Widget _buidDueDate() {
      // String dateString = dueDate.;
      //     ;
      return Text(
        dueDateString,
        style: const TextStyle(fontSize: 26),
      );
    }

    Widget _buildConfirmBTN() {
      void _send() {
        // Scaffold.of(context).;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Center(
                child: Text(
              "Book reserved successfully !",
            )),
            backgroundColor: Color.fromARGB(255, 29, 208, 38),
            showCloseIcon: true,
            // width: 300.0,
            elevation: 20,
            behavior: SnackBarBehavior.floating,
            // animation:AnimatedOpacity(opacity: 1, duration: Duration(seconds: 1)),
            dismissDirection: DismissDirection.horizontal,
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))
            // width: 200,
            // clipBehavior: Clip.antiAlias(),
            ));
      }

      return ElevatedButton.icon(
          onPressed: _send,
          icon: const Icon(Icons.check),
          label: const Text('Confirm Reservation'));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Reserve Book")),
      body: Container(
          // color: Colors.red,
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBookTitle(),
                const SizedBox(
                  height: 30,
                ),
                _buidDueDate(),
                _buildSelectDateButton(),
                _buildConfirmBTN()
              ],
            ),
          )),
    );
  }
}
