import 'package:zup_core/enums/time_unit.dart';

/// Object representing any time ago: minutes, hours, days, months, years etc...
class TimeAgo {
  /// The time unit of the [value] param (e.g minute), derived from the [TimeUnit] enum
  final TimeUnit timeUnit;

  /// The value of the time unit, an integer representing the minutes, hours, days, months, years etc...
  final int value;

  /// Object representing any time ago: minutes, hours, days, months, years etc...
  TimeAgo({required this.timeUnit, required this.value});
}
