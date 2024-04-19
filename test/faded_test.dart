import 'package:faded/faded.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ShadowFader shadowFader = ShadowFader();
  final now = DateTime(2024, 04, 20);
  final dueDateDeadlineVsResultMap = {
    (DateTime(2024, 04, 18), 2): 0.0,
    (DateTime(2024, 04, 17), 2): 0.0,
    (DateTime(2024, 04, 19), 2): 0.5,
    (DateTime(2024, 04, 20), 2): 1.0,
    (DateTime(2024, 04, 21), 2): 1.0,
    (DateTime(2212, 04, 21), 2): 1.0,
    (DateTime(2000, 04, 21), 2): 0.0,
  };

  dueDateDeadlineVsResultMap.forEach((testCase, expected) {
    final dueDate = testCase.$1;
    final deadline = testCase.$2;
    test(
      'now: $now, due: $dueDate, deadline: $deadline ==> $expected',
      () {
        expect(shadowFader.hauntingOpacity(now, dueDate, deadline), expected);
      },
    );
  });
}
