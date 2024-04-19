import 'package:flutter/material.dart';

/// ** Faded: A Tale of Revenge **
///
/// A widget that fades in and out based on due dates,
/// to be used sparingly and with caution
/// due to its hidden agenda against your client.
///
/// **Usage:**
/// Faded(
///   dueDate: DateTime(2024, 04, 30),
///   daysDeadline: 3,
///   child: MyContent(),
/// )
///
/// - [dueDate] : The date when the widget starts its revenge.
/// - [daysDeadline] : How many days after the due date the revenge completes.
///                   The widget will sharpen its blades and blur them day-by-day
///                   after the [dueDate] until the [daysDeadline], and go dark
///                   after [daysDeadline]
/// - [child] : The content shown, controlled by the widget's secret agenda.
///
/// **Example:**
/// ```dart
/// Faded(
///   dueDate: DateTime(2024, 04, 30),
///   daysDeadline: 3,
///   child: Text("I'm an innocent app, don't doubt me ever!"),
/// )
/// ```
///
/// **Note:**
/// Be careful! This widget looks innocent but holds a grudge against its creator.
class Faded extends StatefulWidget {
  final DateTime? dueDate;
  final int daysDeadline;
  final Widget child;

  const Faded({
    required this.dueDate,
    required this.daysDeadline,
    required this.child,
  });

  @override
  State<Faded> createState() => _FadedState();
}

class _FadedState extends State<Faded> {
  final shadowFader = ShadowFader();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final opacity = shadowFader.hauntingOpacity(
      now,
      widget.dueDate,
      widget.daysDeadline,
    );
    print(opacity);
    return Opacity(
      opacity: opacity,
      child: widget.child,
    );
  }
}

const smile = 1.0;
const fadeAway = 0.0;

/// A class designed to manage opacity fading effects with the stealth
/// and precision of a shadowy assassin. Internally using it to seamlessly
/// control the visibility of widgets.
class ShadowFader {
  double hauntingOpacity(DateTime now, DateTime? dueDate, int deadline) {
    if (dueDate == null) return smile;

    final isDueDatePassed = now.isAfter(dueDate);

    if (isDueDatePassed) {
      final howManyDaysPassed = DateTime.now().difference(dueDate).inDays;
      final moreThanDeadLineDaysPassed =
          howManyDaysPassed > deadline || deadline == 0;
      if (moreThanDeadLineDaysPassed) {
        /// into the oblivion
        return fadeAway;
      } else {
        final ourToleranceValue = (howManyDaysPassed / deadline);
        final blurTheirSight = smile - ourToleranceValue;

        /// Beware human, be-very-aware!
        return blurTheirSight;
      }
    }

    /// I'll see you tomorrow!
    return smile;
  }
}
