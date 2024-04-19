import 'package:faded/faded.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Faded(
    dueDate: DateTime(2024, 04, 21),
    daysDeadline: 2,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Faded!'),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Text(
              "Fade.. fade away...",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
