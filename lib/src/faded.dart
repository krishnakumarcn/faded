import 'package:flutter/material.dart';

class Faded extends StatefulWidget {
  final String dueDate;
  final int daysDeadline;
  final Widget child;

  const Faded(
      {@required this.dueDate,
      @required this.daysDeadline,
      @required this.child});

  @override
  State<StatefulWidget> createState() => _FadedState();
}

class _FadedState extends State<Faded> {
  @override
  Widget build(BuildContext context) {
    double opacity = getOpacity(widget.dueDate, widget.daysDeadline);
    return Opacity(
      opacity: opacity,
      child: widget.child,
    );
  }

  double getOpacity(String dueDate, int deadline) {
    final _dueDate = DateTime.tryParse(dueDate);
    if (_dueDate == null) return 1.0;

    double opacity = 1.0;
    final now = DateTime.now();
    if (now.isAfter(_dueDate)) {
      int differenceInDays = DateTime.now().difference(_dueDate).inDays;
      if (differenceInDays > deadline) {
        opacity = 0.0;
      } else {
        double finishValue = (differenceInDays / deadline);
        opacity = 1.0 - finishValue;
      }
    }
    return opacity;
  }
}
