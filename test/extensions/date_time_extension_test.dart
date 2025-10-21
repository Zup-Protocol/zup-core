import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/enums/enums.dart';
import 'package:zup_core/extensions/date_time_extension.dart';

void main() {
  test(
    """When calling 'secondsAgo' with a time that is not exactly divisible by 1000 milliseconds
    it should return exactly how many seconds ago the date is from now as an int rounded down""",
    () {
      final date = DateTime.now().subtract(const Duration(milliseconds: 1500));

      expect(date.secondsAgo, 1);
    },
  );

  test(
    """When calling 'secondsAgo' with a time that is exactly divisible by 1000 milliseconds
    it should return exactly how many seconds ago the date is from now""",
    () {
      final date = DateTime.now().subtract(const Duration(milliseconds: 2000));

      expect(date.secondsAgo, 2);
    },
  );

  test(
    """When calling 'minutesAgo' with a time that is not exactly divisible by 60 seconds
    it should return exactly how many minutes ago the date is from now as an int rounded down""",
    () {
      final date = DateTime.now().subtract(const Duration(seconds: 130));

      expect(date.minutesAgo, 2);
    },
  );

  test(
    """When calling 'minutesAgo' with a time that is exactly divisible by 60 seconds
    it should return exactly how many minutes ago the date is from now""",
    () {
      final date = DateTime.now().subtract(const Duration(seconds: 180));

      expect(date.minutesAgo, 3);
    },
  );
  test(
    """When calling 'hoursAgo' with a time that is not exactly divisible by 60 minutes
    it should return exactly how many hours ago the date is from now as an int rounded down""",
    () {
      final date = DateTime.now().subtract(const Duration(minutes: 125));

      expect(date.hoursAgo, 2);
    },
  );

  test(
    """When calling 'hoursAgo' with a time that is exactly divisible by 60 minutes
    it should return exactly how many hours ago the date is from now""",
    () {
      final date = DateTime.now().subtract(const Duration(minutes: 180));

      expect(date.hoursAgo, 3);
    },
  );

  test(
    """When calling 'daysAgo' with a time that is not exactly divisible by 24 hours
    it should return exactly how many days ago the date is from now as an int rounded down""",
    () {
      final date = DateTime.now().subtract(const Duration(hours: 50));

      expect(date.daysAgo, 2);
    },
  );

  test(
    """When calling 'daysAgo' with a time that is exactly divisible by 24 hours
    it should return exactly how many days ago the date is from now""",
    () {
      final date = DateTime.now().subtract(const Duration(hours: 72));

      expect(date.daysAgo, 3);
    },
  );

  test(
    """When calling 'monthsAgo' with a time that is not exactly divisible by 30 days
    it should return exactly how many months ago the date is from now as an int rounded down""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 65));

      expect(date.monthsAgo, 2);
    },
  );

  test(
    """When calling 'monthsAgo' with a time that is exactly divisible by 30 days
    it should return exactly how many months ago the date is from now""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 90));

      expect(date.monthsAgo, 3);
    },
  );

  test(
    """When calling 'yearsAgo' with a time that is not exactly divisible by 365 days
    it should return exactly how many years ago the date is from now as an int rounded down""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 400));

      expect(date.yearsAgo, 1);
    },
  );

  test(
    """When calling 'yearsAgo' with a time that is exactly divisible by 365 days
    it should return exactly how many years ago the date is from now""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 730));

      expect(date.yearsAgo, 2);
    },
  );

  test(
    """When calling 'timeAgo' with less than 60 seconds difference
      it should return a TimeAgo object with seconds""",
    () {
      final date = DateTime.now().subtract(const Duration(seconds: 30));

      final result = date.timeAgo;

      expect(result.timeUnit, TimeUnit.seconds);
      expect(result.value, 30);
    },
  );

  test(
    """When calling 'timeAgo' with less than 60 minutes difference
      it should return a TimeAgo object with minutes""",
    () {
      final date = DateTime.now().subtract(const Duration(minutes: 45));

      final result = date.timeAgo;

      expect(result.timeUnit, TimeUnit.minutes);
      expect(result.value, 45);
    },
  );

  test(
    """When calling 'timeAgo' with less than 24 hours difference
      it should return a TimeAgo object with hours""",
    () {
      final date = DateTime.now().subtract(const Duration(hours: 12));

      final result = date.timeAgo;

      expect(result.timeUnit, TimeUnit.hours);
      expect(result.value, 12);
    },
  );

  test(
    """When calling 'timeAgo' with less than 30 days difference
      it should return a TimeAgo object with days""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 10));

      final result = date.timeAgo;

      expect(result.timeUnit, TimeUnit.days);
      expect(result.value, 10);
    },
  );

  test(
    """When calling 'timeAgo' with less than 12 months difference
      it should return a TimeAgo object with months""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 240));

      final result = date.timeAgo;

      expect(result.timeUnit, TimeUnit.months);
      expect(result.value, 8);
    },
  );

  test(
    """When calling 'timeAgo' with more than 12 months difference
      it should return a TimeAgo object with years""",
    () {
      final date = DateTime.now().subtract(const Duration(days: 800));

      final result = date.timeAgo;

      expect(result.timeUnit, TimeUnit.years);
      expect(result.value, 2);
    },
  );
}
