import 'package:clock/clock.dart';
import 'package:zup_core/zup_core.dart';

extension DateTimeExtension on DateTime {
  /// Get how many milliseconds ago a passed date is as an [int].
  int get millisecondsAgo => clock.now().difference(this).inMilliseconds;

  /// Get how many seconds ago a passed date is as a [int]
  ///
  /// Note: rounded down if not an integer, so 1500 milliseconds -> 1 second
  int get secondsAgo => clock.now().difference(this).inSeconds;

  /// Get how many minutes ago a passed date is as an [int].
  ///
  /// Note: rounded down if not an integer, so 100 seconds -> 1 minute
  int get minutesAgo => clock.now().difference(this).inMinutes;

  /// Get how many hours ago a passed date is as a [int]
  ///
  /// Note: rounded down if not an integer, so 100 minutes  -> 1 hour
  int get hoursAgo => clock.now().difference(this).inHours;

  /// Get how many days ago a passed date is as a [int]
  ///
  /// Note: rounded down if not an integer, so 30 hours -> 1 day
  int get daysAgo => clock.now().difference(this).inDays;

  /// Get how many months ago a passed date is as a [int]
  ///
  /// Note: rounded down if not an integer, so 50 days -> 1 month
  int get monthsAgo {
    final now = clock.now();

    int months = (now.year - year) * 12 + (now.month - month);

    if (now.day < day) months -= 1;

    return months < 0 ? 0 : months;
  }

  /// Get how many years ago a passed date is as a [int]
  ///
  /// Note: rounded down if not an integer, so 400 days -> 1 year
  int get yearsAgo => (monthsAgo / 12).truncate();

  /// Get how many minutes, hours, days, months or years ago a passed date is
  ///
  /// Returns seconds if less than 60 seconds ago.
  ///
  /// Returns minutes if less than 60 minutes ago.
  ///
  /// Returns hours if less than 24 hours ago.
  ///
  /// Returns days if less than 30 days ago.
  ///
  /// Returns months if less than 12 months ago.
  ///
  /// Returns years if it is more than 12 months ago
  TimeAgo get timeAgo {
    if (secondsAgo < 60) {
      return TimeAgo(
        amountTimeUnit: TimeUnit.seconds,
        amount: secondsAgo,
        remainder: millisecondsAgo % 1000,
        remainderTimeUnit: TimeUnit.milliseconds,
      );
    }

    if (minutesAgo < 60) {
      return TimeAgo(
        amountTimeUnit: TimeUnit.minutes,
        amount: minutesAgo,
        remainder: secondsAgo % 60,
        remainderTimeUnit: TimeUnit.seconds,
      );
    }

    if (hoursAgo < 24) {
      return TimeAgo(
        amountTimeUnit: TimeUnit.hours,
        amount: hoursAgo,
        remainder: minutesAgo % 60,
        remainderTimeUnit: TimeUnit.minutes,
      );
    }

    if (daysAgo < 30) {
      return TimeAgo(
        amountTimeUnit: TimeUnit.days,
        amount: daysAgo,
        remainder: hoursAgo % 24,
        remainderTimeUnit: TimeUnit.hours,
      );
    }

    if (monthsAgo < 12) {
      final nowMonthsAgo = clock.now().copyWith(
        month: clock.now().month - monthsAgo,
      );

      final daysDifference = nowMonthsAgo.difference(this).inDays;

      return TimeAgo(
        amountTimeUnit: TimeUnit.months,
        amount: monthsAgo,
        remainder: daysDifference,
        remainderTimeUnit: TimeUnit.days,
      );
    }

    return TimeAgo(
      amountTimeUnit: TimeUnit.years,
      amount: yearsAgo,
      remainder: monthsAgo % 12,
      remainderTimeUnit: TimeUnit.months,
    );
  }
}
