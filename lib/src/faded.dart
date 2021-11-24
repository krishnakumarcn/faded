import 'package:flutter/material.dart';

class Faded extends StatefulWidget {
  /// Creates a widget that can be faded in and out.
  /// The [child] argument must not be null.
  /// The [opacity] argument must be a value between 0.0 and 1.0, inclusive.
  final String dueDate;
  /// The dueDate is the date you want the widget to fade in and out.
  final int daysDeadline;
  /// The daysDeadline is the number of days you want the widget to fade in and out.
  /// It must also equate with the due date you are setting
  final Widget child;
  /// The widget to display as the content of this widget.

  const Faded(
      {required this.dueDate,
      required this.daysDeadline,
      required this.child});

  @override
  State<StatefulWidget> createState() => _FadedState();
}

class _FadedState extends State<Faded> {
  @override
  Widget build(BuildContext context) {
    /// This function is a container that will fade in and out based on the due date and days deadline.
    /// It will also display the child widget.
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
