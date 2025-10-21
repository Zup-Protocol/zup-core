import 'package:clock/clock.dart';
import 'package:zup_core/zup_core.dart';

extension DateTimeExtension on DateTime {
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
  int get monthsAgo => clock.now().difference(this).inDays ~/ 30;

  /// Get how many years ago a passed date is as a [int]
  ///
  /// Note: rounded down if not an integer, so 400 days -> 1 year
  int get yearsAgo => clock.now().difference(this).inDays ~/ 365;

  /// Get how many minutes, hours, days, months or years ago a passed date is
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
      return TimeAgo(timeUnit: TimeUnit.seconds, value: secondsAgo);
    }

    if (minutesAgo < 60) {
      return TimeAgo(timeUnit: TimeUnit.minutes, value: minutesAgo);
    }

    if (hoursAgo < 24) {
      return TimeAgo(timeUnit: TimeUnit.hours, value: hoursAgo);
    }

    if (daysAgo < 30) {
      return TimeAgo(timeUnit: TimeUnit.days, value: daysAgo);
    }

    if (monthsAgo < 12) {
      return TimeAgo(timeUnit: TimeUnit.months, value: monthsAgo);
    }

    return TimeAgo(timeUnit: TimeUnit.years, value: yearsAgo);
  }
}
