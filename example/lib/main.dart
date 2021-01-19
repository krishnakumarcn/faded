import 'package:faded/faded.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Faded(
    // Due date should be in yyyy-mm-dd format
    dueDate: '2021-01-15',
    daysDeadline: 12,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Faded!'),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              "Fade.. fade away...",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
