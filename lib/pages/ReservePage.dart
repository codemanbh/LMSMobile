import 'package:flutter/material.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ??
            {};
    DateTime today = DateTime.now();
    DateTime minDate = today.add(Duration(days: 3));
    DateTime midDate = today.add(Duration(days: 30));
    DateTime maxDate = today.add(Duration(days: 60));
    DateTime? dueDate = midDate;

    Widget _buildSelectDateButton() {
      void handeDateSelection() async {
        print('reserve');
        dueDate = await showDatePicker(
            context: context,
            initialDate: midDate,
            firstDate: minDate,
            lastDate: maxDate);
      }

      return ElevatedButton(
          onPressed: handeDateSelection, child: Text("Change due date"));
    }

    Widget _buildBookTitle() {
      return Text(
        data['book'].title,
        style: TextStyle(fontSize: 30),
      );
    }

    Widget _buidDueDate() {
      String dateString =
          "Due date: ${dueDate?.day}/${dueDate?.month}/${dueDate?.year}";
      return Text(
        dateString,
        style: TextStyle(fontSize: 26),
      );
    }

    Widget _buildConfirmBTN() {
      void _send() {}
      return ElevatedButton.icon(
        
          onPressed: _send, icon: Icon(Icons.check), label: Text('Confirm'));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Reserve")),
      body: Container(
          // color: Colors.red,
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBookTitle(),
                SizedBox(
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
