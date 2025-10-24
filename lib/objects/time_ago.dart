import 'package:zup_core/enums/time_unit.dart';

/// Object representing any time ago: minutes, hours, days, months, years etc...
class TimeAgo {
  /// The time unit of the [amount] param (e.g minutes), derived from the [TimeUnit] enum
  final TimeUnit amountTimeUnit;

  /// The value of the time unit, an integer representing the minutes, hours, days, months, years etc...
  final int amount;

  /// An integer representing the remainder of the [amount] helping to show a more accurate time ago,
  /// like "1 minute and 30 seconds ago" instead of "1 minute ago"
  /// only. In this case the [amount] would be 1 and the [remainder] would be 30
  final int remainder;

  /// The time unit of the [remainder] param (e.g seconds), derived from the [TimeUnit] enum
  final TimeUnit remainderTimeUnit;

  /// Object representing any time ago: minutes, hours, days, months, years etc...
  TimeAgo({
    required this.amountTimeUnit,
    required this.amount,
    required this.remainder,
    required this.remainderTimeUnit,
  });
}
