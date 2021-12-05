import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String date = DateFormat.yMMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text('Date Picker'),
              onPressed: () {
                showDatePicker(
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData.light(),
                        child: Container(
                          child: child,
                        ));
                  },
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2030),
                  selectableDayPredicate: (day) {
                    if (day
                        .isBefore(DateTime.now().subtract(Duration(days: 1)))) {
                      return false;
                    }
                    return true;
                  },
                ).then((value) {
                  value != null
                      ? setState(() {
                          date = DateFormat.yMMMMd().format(value);
                        })
                      : setState(() {
                          date = 'Jangan Dicancel';
                        });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
