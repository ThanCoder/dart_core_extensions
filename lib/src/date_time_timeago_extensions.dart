///format time
extension DateTimeTimeagoExtension on DateTime {
  /// ### Format Date && Time Lable
  String formatDateTimeAgo() => formatTimeAgo();

  ///
  /// ### auto date && time label
  ///
  String formatTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inSeconds < 15) {
      return 'now';
    }

    // ၁ မိနစ် အတွင်းဆိုရင် 'now' လို့ပြမယ်
    if (difference.inMinutes < 1) {
      return '${difference.inSeconds}s';
    }

    // ၁ နာရီ အတွင်းဆိုရင် မိနစ်အပိုင်းအစ ပြမယ် (ဥပမာ- 15m)
    if (difference.inHours < 1) {
      return '${difference.inMinutes}m';
    }

    // ၂၄ နာရီ (၁ ရက်) အတွင်းဆိုရင် နာရီအပိုင်းအစ ပြမယ် (ဥပမာ- 5h)
    if (difference.inDays < 1) {
      return '${difference.inHours}h';
    }

    // ၇ ရက် အတွင်းဆိုရင် ရက်အပိုင်းအစ ပြမယ် (ဥပမာ- 1 day ago သို့ 3 days ago)
    if (difference.inDays < 7) {
      return difference.inDays == 1
          ? '1 day ago'
          : '${difference.inDays} days ago';
    }

    // ရက်ပေါင်း ၃၀ အတွင်းဆိုရင် ရက်သတ္တပတ် (Weeks) နဲ့ပြမယ် (ဥပမာ- 1 week သို့ 2 weeks)
    if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return weeks == 1 ? '1 week' : '$weeks weeks';
    }

    // ---- ဒီနေရာကနေစပြီး ပြင်ပါမယ် ----

    // နှစ် ကွာခြားချက်နဲ့ လ ကွာခြားချက်ကို တိုက်ရိုက်တွက်ချက်တာ ဖြစ်ပါတယ်
    int months = (now.year - year) * 12 + now.month - month;

    // ရက်စွဲ မပြည့်သေးရင် လအရေအတွက်ကို ၁ လ လျှော့ဖို့ (ဥပမာ- ဒီနေ့ ၁၇ ရက်၊ ပေးထားတဲ့နေ့က ၂၀ ရက်ဆိုရင် လမပြည့်သေးဘူး)
    if (now.day < day) {
      months--;
    }

    // ၁ နှစ် (၁၂ လ) အောက်ဆိုရင် လနဲ့ပြမယ်
    if (months < 12) {
      return months == 1 ? '1 month ago' : '$months months ago';
    }

    // ၁ နှစ်နှင့် အထက်ဆိုရင် နှစ်နဲ့ပြမယ်
    int years = (months / 12).floor();
    return years == 1 ? '1 year ago' : '$years years ago';
  }

  /// time ago
  String toTimeAgo({
    String justNow = 'just now',
    String secondsAgo = 's ago',
    String minutesAgo = 'm ago',
    String hoursAgo = 'h ago',
    String daysAgo = 'd ago',
    String yesterday = 'yesterday',
  }) {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 10) {
      return justNow;
    }
    if (diff.inMinutes < 1) {
      return '${diff.inSeconds}$secondsAgo';
    }
    if (diff.inHours < 1) {
      return '${diff.inMinutes}$minutesAgo';
    }
    if (diff.inDays < 1) {
      return '${diff.inHours}$hoursAgo';
    }
    if (diff.inDays == 1) {
      return yesterday;
    }
    return '${diff.inDays}$daysAgo';
  }

  /// time ago
  String toTimeAgoFull() {
    final diff = DateTime.now().difference(this);

    if (diff.inSeconds < 5) return 'just now';
    if (diff.inMinutes < 1) {
      return '${diff.inSeconds} seconds ago';
    }
    if (diff.inHours < 1) {
      return '${diff.inMinutes} minutes ago';
    }
    if (diff.inDays < 1) {
      return '${diff.inHours} hours ago';
    }
    if (diff.inDays == 1) {
      return 'yesterday';
    }
    return '${diff.inDays} days ago';
  }

  ///relative time
  String toRelativeTime() {
    final now = DateTime.now();
    final diff = difference(now);

    final isPast = diff.isNegative;
    final duration = diff.abs();

    String label;

    if (duration.inSeconds < 60) {
      label = '${duration.inSeconds}s';
    } else if (duration.inMinutes < 60) {
      label = '${duration.inMinutes}m';
    } else if (duration.inHours < 24) {
      label = '${duration.inHours}h';
    } else {
      label = '${duration.inDays}d';
    }

    return isPast ? '$label ago' : 'in $label';
  }
}
