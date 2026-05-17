/// Time Lable class
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

  /// ၁။ အချိန်ဘယ်လောက်ကျန်သေးလဲဆိုတာကို လူဖတ်လို့လွယ်တဲ့ပုံစံ (ETA Label) ပြောင်းပေးမည့် method.
  ///
  /// ဥပမာ - 01:25:30 ကျန်သေးရင် "1h 25m 30s" လို့ ပြပေးမှာဖြစ်ပါတယ်။
  String toRemainingLabel() {
    if (isNegative || inSeconds == 0) {
      return '0s';
    }

    final List<String> parts = [];

    final int days = inDays;
    final int hours = inHours % 24;
    final int minutes = inMinutes % 60;
    final int seconds = inSeconds % 60;

    if (days > 0) parts.add('${days}d');
    if (hours > 0) parts.add('${hours}h');
    if (minutes > 0) parts.add('${minutes}m');
    if (seconds > 0) parts.add('${seconds}s');

    // အလွန်တိုတောင်းတဲ့အချိန် (ms) ပဲရှိရင် 0s ပြမယ့်အစား 1s လို့ပဲ အကြမ်းဖျင်းပြပေးလိုက်မယ်
    if (parts.isEmpty && inMilliseconds > 0) {
      return '1s';
    }

    return parts.join(' ');
  }

  /// ၂။ ကုဒ်တွေရဲ့ အလုပ်လုပ်ရတဲ့ကြာချိန် (Execution Time) ကို စမ်းသပ်ဖို့ Static Method.
  ///
  /// အသုံးပြုလိုတဲ့ block ကို dynamic closure အနေနဲ့ လှမ်းပေးရုံပါပဲ။
  static Future<Duration> testExecutionTime(
    Future<void> Function() action,
  ) async {
    final stopwatch = Stopwatch()..start();

    await action(); // ကိုယ်စမ်းသပ်ချင်တဲ့ ကုဒ်က အလုပ်လုပ်သွားမယ်

    stopwatch.stop();
    return stopwatch.elapsed;
  }
}
