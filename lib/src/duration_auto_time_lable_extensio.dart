extension DurationAutoTimeLableExtension on Duration {
  String autoTimeLabel({
    String hourLabel = 'h',
    String minuteLabel = 'm',
    String secondLabel = 's',
    String millisecondLabel = 'ms',
  }) {
    if (inHours >= 1) {
      return '$inHours $hourLabel';
    }
    if (inMinutes >= 1) {
      return '$inMinutes $minuteLabel';
    }
    if (inSeconds >= 1) {
      return '$inSeconds $secondLabel';
    }
    return '$inMilliseconds $millisecondLabel';
  }
}
