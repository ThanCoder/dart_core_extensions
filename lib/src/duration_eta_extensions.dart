extension DurationEtaExtensions on Duration {
  /// progress: 0.0 ~ 1.0
  Duration calculateEta(double progress) {
    if (progress <= 0 || progress >= 1) {
      return Duration.zero;
    }

    final totalMilliseconds = inMilliseconds / progress;

    final remainingMilliseconds = totalMilliseconds - inMilliseconds;

    return Duration(milliseconds: remainingMilliseconds.round());
  }

  
}
