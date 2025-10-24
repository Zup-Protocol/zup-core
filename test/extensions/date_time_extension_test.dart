import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/enums/enums.dart';
import 'package:zup_core/extensions/date_time_extension.dart';

void main() {
  test(
    """When calling 'millisecondsAgo', it should return the exacly milliseconds ago
  the passed date is""",
    () {
      final now = DateTime(2022, 10, 10, 10, 10, 10);

      withClock(Clock.fixed(now), () {
        final date = now.subtract(const Duration(milliseconds: 1111));

        expect(date.millisecondsAgo, 1111);
      });
    },
  );

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
    """When calling 'monthsAgo' with a time that has the day higher
    than the current day and is within the same year,
    it should return the month difference, minusing 1,
    because the month has not fully passed""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 23)), () {
        final dateAgo = DateTime(2025, 2, 24);

        expect(dateAgo.monthsAgo, 7);
      });
    },
  );

  test(
    """When calling 'monthsAgo' with a time that has the day higher
    than the current day and is not within the same year,
    it should return the month difference, minusing 1,
    because the month has not fully passed""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 23)), () {
        final dateAgo = DateTime(2015, 10, 24);

        expect(dateAgo.monthsAgo, 119);
      });
    },
  );

  test(
    """When calling 'monthsAgo' with a time that has the day lower
    than the current day and is not within the same year,
    it should return the exact month difference between the dates""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 23)), () {
        final dateAgo = DateTime(2015, 10, 22);

        expect(dateAgo.monthsAgo, 120);
      });
    },
  );

  test(
    """When calling 'monthsAgo' with a time that has the day lower
    than the current day and is within the same year,
    it should return the exact month difference between the dates""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 23)), () {
        final dateAgo = DateTime(2025, 01, 10);

        expect(dateAgo.monthsAgo, 9);
      });
    },
  );

  test(
    """When calling 'monthsAgo' with a time that is not exactly 1 month
    ago comparing the day, it should return 0 months ago""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 23)), () {
        final dateAgo = DateTime(2025, 10, 24);

        expect(dateAgo.monthsAgo, 0);
      });
    },
  );

  test(
    """When calling 'monthsAgo' with a time that is exactly 1 month
     ago or greater, comparing the day, it should return 1 month ago""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 24)), () {
        final dateAgo = DateTime(2025, 09, 24);

        expect(dateAgo.monthsAgo, 1);
      });
    },
  );

  test(
    """When calling 'monthsAgo' passing many leap years,
    it should still calculate the correct amount of months
    based on the days between the dates""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 24)), () {
        final dateAgo = DateTime(2000, 10, 25);

        expect(dateAgo.monthsAgo, 299);
      });
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
    """When calling 'yearsAgo' with a time that is not exactly 1 year ago
    based on the day, it should return 0 years ago""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 24)), () {
        final dateAgo = DateTime(2024, 10, 25);

        expect(dateAgo.yearsAgo, 0);
      });
    },
  );

  test(
    """When calling 'yearsAgo' with a time that is exactly 1 year ago
    based on the day, it should return 1 year ago""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 24)), () {
        final dateAgo = DateTime(2024, 10, 24);

        expect(dateAgo.yearsAgo, 1);
      });
    },
  );

  test(
    """When calling 'yearsAgo' with a time that is many years ago,
    passing through many leap years, but the day that the year
    turns has not passed, it should return the correct amount of years ago
    minusing 1 year""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 24)), () {
        final dateAgo = DateTime(1990, 10, 25);

        expect(dateAgo.yearsAgo, 34);
      });
    },
  );

  test(
    """When calling 'yearsAgo' with a time that is many years ago,
    passing through many leap years, and the day that the year
    turns has passed, it should return the correct amount of years ago""",
    () {
      withClock(Clock.fixed(DateTime(2025, 10, 24)), () {
        final dateAgo = DateTime(1990, 10, 22);

        expect(dateAgo.yearsAgo, 35);
      });
    },
  );

  test(
    """When calling 'timeAgo' with less than 60 seconds difference
      it should return a TimeAgo object with seconds.
      The remainder for the seconds should be in milliseconds""",
    () {
      final now = DateTime(1998, 1, 1);

      withClock(Clock.fixed(now), () {
        final date = now.subtract(
          const Duration(seconds: 30, milliseconds: 500),
        );

        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.seconds);
        expect(result.amount, 30);
        expect(result.remainder, 500);
        expect(result.remainderTimeUnit, TimeUnit.milliseconds);
      });
    },
  );

  test(
    """When calling 'timeAgo' with less than 60 minutes difference
      it should return a TimeAgo object with minutes. The remainder
      for the minutes should be in seconds""",
    () {
      final now = DateTime(1998, 1, 1);

      withClock(Clock.fixed(now), () {
        final date = now.subtract(const Duration(minutes: 45, seconds: 30));

        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.minutes);
        expect(result.amount, 45);
        expect(result.remainder, 30);
        expect(result.remainderTimeUnit, TimeUnit.seconds);
      });
    },
  );

  test(
    """When calling 'timeAgo' with less than 24 hours difference
      it should return a TimeAgo object with hours""",
    () {
      final now = DateTime(1998, 1, 1);
      withClock(Clock.fixed(now), () {
        final date = now.subtract(const Duration(hours: 12, minutes: 24));
        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.hours);
        expect(result.amount, 12);
        expect(result.remainder, 24);
        expect(result.remainderTimeUnit, TimeUnit.minutes);
      });
    },
  );

  test(
    """When calling 'timeAgo' with less than 30 days difference
      it should return a TimeAgo object with days.
      The remainder for the days should be in hours""",
    () {
      final now = DateTime(1998, 1, 1);

      withClock(Clock.fixed(now), () {
        final date = now.subtract(const Duration(days: 10, hours: 22));

        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.days);
        expect(result.amount, 10);
        expect(result.remainder, 22);
        expect(result.remainderTimeUnit, TimeUnit.hours);
      });
    },
  );

  test(
    """When calling 'timeAgo' with less than 12 months difference
      and a day higher than now day, it should return a TimeAgo
      object with months subtracting 1, and the remainder in days""",
    () {
      final now = DateTime(2024, 10, 1);

      withClock(Clock.fixed(now), () {
        final date = now.copyWith(month: 2, day: 29);

        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.months);
        expect(result.amount, 7);
        expect(result.remainder, 1);
        expect(result.remainderTimeUnit, TimeUnit.days);
      });
    },
  );

  test(
    """When calling 'timeAgo' with less than 12 months difference
      and a day lower than now day, it should return a TimeAgo
      object with months, and the remainder in days""",
    () {
      final now = DateTime(1998, 10, 20);

      withClock(Clock.fixed(now), () {
        final date = now.copyWith(month: 2, day: 10);

        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.months);
        expect(result.amount, 8);
        expect(result.remainder, 10);
        expect(result.remainderTimeUnit, TimeUnit.days);
      });
    },
  );

  test(
    """When calling 'timeAgo' with more than 12 months difference
      it should return a TimeAgo object with years. The remainder
      for the years should be in months""",
    () {
      final now = DateTime(1998, 10, 20);

      withClock(Clock.fixed(now), () {
        final date = now.subtract(const Duration(days: 800));

        final result = date.timeAgo;

        expect(result.amountTimeUnit, TimeUnit.years);
        expect(result.amount, 2);
        expect(result.remainder, 2);
        expect(result.remainderTimeUnit, TimeUnit.months);
      });
    },
  );
}
