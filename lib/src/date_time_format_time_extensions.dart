extension DateTimeFormatTimeExtensions on DateTime {
  String get time24 => formatTime();
  String get time12 => formatTime(use24Hour: false);
  String get timeWithSeconds => formatTime(showSeconds: true);

  String formatTime({
    bool use24Hour = false,
    bool showSeconds = false,
    bool padZero = true,
  }) {
    final h = use24Hour ? hour : (hour % 12 == 0 ? 12 : hour % 12);
    final m = minute;
    final s = second;

    String two(int v) => padZero ? v.toString().padLeft(2, '0') : '$v';

    final buffer = StringBuffer()
      ..write(two(h))
      ..write(':')
      ..write(two(m));

    if (showSeconds) {
      buffer
        ..write(':')
        ..write(two(s));
    }

    if (!use24Hour) {
      buffer.write(hour >= 12 ? ' PM' : ' AM');
    }

    return buffer.toString();
  }
}
