extension DateTimeTimeagoExtension on DateTime {
  String timeAgo({
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

  String timeAgoFull() {
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

  String relativeTime() {
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
