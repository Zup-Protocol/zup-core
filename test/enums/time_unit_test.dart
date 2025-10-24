import 'package:flutter_test/flutter_test.dart';
import 'package:zup_core/enums/time_unit.dart';

void main() {
  test(
    "When calling 'isMilliseconds' with a time unit of milliseconds, it should return true",
    () {
      expect(TimeUnit.milliseconds.isMilliseconds, true);
    },
  );

  test(
    "When calling 'isMilliseconds' with a time unit that is not milliseconds, it should return false",
    () {
      expect(TimeUnit.seconds.isMilliseconds, false);
    },
  );

  test(
    "When calling 'isSeconds' with a time unit of seconds, it should return true",
    () {
      expect(TimeUnit.seconds.isSeconds, true);
    },
  );

  test(
    "When calling 'isSeconds' with a time unit that is not seconds, it should return false",
    () {
      expect(TimeUnit.minutes.isSeconds, false);
    },
  );

  test(
    "When calling 'isMinutes' with a time unit of minutes, it should return true",
    () {
      expect(TimeUnit.minutes.isMinutes, true);
    },
  );

  test(
    "When calling 'isMinutes' with a time unit that is not minutes, it should return false",
    () {
      expect(TimeUnit.seconds.isMinutes, false);
    },
  );

  test(
    "When calling 'isHours' with a time unit of hours, it should return true",
    () {
      expect(TimeUnit.hours.isHours, true);
    },
  );

  test(
    "When calling 'isHours' with a time unit that is not hours, it should return false",
    () {
      expect(TimeUnit.minutes.isHours, false);
    },
  );

  test(
    "When calling 'isDays' with a time unit of days, it should return true",
    () {
      expect(TimeUnit.days.isDays, true);
    },
  );

  test(
    "When calling 'isDays' with a time unit that is not days, it should return false",
    () {
      expect(TimeUnit.hours.isDays, false);
    },
  );

  test(
    "When calling 'isMonths' with a time unit of months, it should return true",
    () {
      expect(TimeUnit.months.isMonths, true);
    },
  );

  test(
    "When calling 'isMonths' with a time unit that is not months, it should return false",
    () {
      expect(TimeUnit.days.isMonths, false);
    },
  );

  test(
    "When calling 'isYears' with a time unit of years, it should return true",
    () {
      expect(TimeUnit.years.isYears, true);
    },
  );

  test(
    "When calling 'isYears' with a time unit that is not years, it should return false",
    () {
      expect(TimeUnit.months.isYears, false);
    },
  );
}
