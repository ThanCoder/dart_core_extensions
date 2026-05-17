import 'package:dart_core_extensions/src/types/age_detail.dart';

/// DateTime special class
extension DateTimeFormatTimeExtensions on DateTime {
  /// format 24
  String get time24 => formatTime();

  /// format 12
  String get time12 => formatTime(use24Hour: false);

  /// format seconds
  String get timeWithSeconds => formatTime(showSeconds: true);

  /// format time
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

  /// ၄။ မွေးနေ့ကနေ လက်ရှိအသက် (Age) ကို အော်တို တွက်ချက်ပေးမည့် method
  /// Output ဥပမာ - 29
  int calculateAge() {
    final DateTime today = DateTime.now();
    int age = today.year - year;

    // မွေးနေ့လနဲ့ရက် မရောက်သေးရင် အသက်တစ်နှစ် နုတ်ပေးရန်
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    return age;
  }

  /// မွေးနေ့ကနေ လက်ရှိအချိန်အထိ အသေးစိတ် ကွာခြားချက်ကို
  /// Map အနေနဲ့ (years, months, weeks, days) အကုန်တွက်ပေးမည့် method
  AgeDetail calculateDetailedAge() {
    final DateTime today = DateTime.now();

    // မွေးနေ့က အနာဂတ် ဖြစ်နေရင် အကုန် 0 ပြန်ပေးမယ်
    if (isAfter(today)) {
      // return {'years': 0, 'months': 0, 'weeks': 0, 'days': 0};
      return AgeDetail.empty();
    }

    int years = today.year - year;
    int months = today.month - month;
    int days = today.day - day;

    // ၁။ ရက်အပိုင်းအစ နှုတ်လို့ မလောက်ရင် (ဥပမာ - ဒီနေ့က ၁၀ ရက်၊ မွေးနေ့က ၁၅ ရက်)
    if (days < 0) {
      // ပြီးခဲ့တဲ့လရဲ့ ရက်ပေါင်းကို သွားယူပြီး လက်ရှိရက်ထဲ ပေါင်းပေးရမယ်
      final DateTime previousMonth = DateTime(today.year, today.month, 0);
      days += previousMonth.day;
      months--; // လထဲက တစ်လ နှုတ်တယ်
    }

    // ၂။ လအပိုင်းအစ နှုတ်လို့ မလောက်ရင်
    if (months < 0) {
      months += 12;
      years--; // နှစ်ထဲက တစ်နှစ် နှုတ်တယ်
    }

    // ၃။ ရက်ပေါင်းထဲကနေ ရက်သတ္တပတ် (Weeks) ဘယ်လောက်ရှိလဲ တွက်မယ်
    int weeks = days ~/ 7; // ၇ နဲ့ စားလို့ရတဲ့ အပြည့်ကိန်းကို ယူတယ်
    int remainingDays = days % 7; // ၇ နဲ့ စားလို့ ကြွင်းတဲ့ရက်ကို ယူတယ်

    // return {
    //   'years': years,
    //   'months': months,
    //   'weeks': weeks,
    //   'days': remainingDays,
    // };
    return AgeDetail(
      years: years,
      months: months,
      weeks: weeks,
      days: remainingDays,
    );
  }

  /// အပေါ်က တွက်ချက်မှုကို လူဖတ်လို့လွယ်အောင် စာသား (Label) အဖြစ် ပြောင်းပေးမည့် method
  /// Output ဥပမာ - "29 years, 2 months, 1 week, 3 days"
  String toDetailedAgeLabel() {
    final age = calculateDetailedAge();

    final List<String> parts = [];

    if (age.years > 0) parts.add('${age.years} years');
    if (age.months > 0) parts.add('${age.months} months');
    if (age.weeks > 0) parts.add('${age.weeks} weeks');
    if (age.days > 0) parts.add('${age.days} days');

    if (parts.isEmpty) return '0 days';

    return parts.join(', ');
  }
}
