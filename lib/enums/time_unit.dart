/// Represents different time units such as minutes, hours, days, months or years
enum TimeUnit {
  milliseconds,
  seconds,
  minutes,
  hours,
  days,
  months,
  years;

  /// Return whether if the [TimeUnit] is [TimeUnit.seconds]
  bool get isSeconds => this == TimeUnit.seconds;

  /// Return whether if the [TimeUnit] is [TimeUnit.minutes]
  bool get isMinutes => this == TimeUnit.minutes;

  /// Return whether if the [TimeUnit] is [TimeUnit.hours]
  bool get isHours => this == TimeUnit.hours;

  /// Return whether if the [TimeUnit] is [TimeUnit.days]
  bool get isDays => this == TimeUnit.days;

  /// Return whether if the [TimeUnit] is [TimeUnit.months]
  bool get isMonths => this == TimeUnit.months;

  /// Return whether if the [TimeUnit] is [TimeUnit.years]
  bool get isYears => this == TimeUnit.years;

  /// Return whether if the [TimeUnit] is [TimeUnit.milliseconds]
  bool get isMilliseconds => this == TimeUnit.milliseconds;
}
