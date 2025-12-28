import 'package:dart_core_extensions/src/date_time_format_time_extensions.dart';
import 'package:dart_core_extensions/src/date_time_timeago_extensions.dart';

void main() {
  final path = '/home/////than///thancoder//';

  final date = DateTime.now().subtract(Duration(hours: 1, days: 2));

  print('timeago: ${date.timeAgo()}');
  print('timeago fullText: ${date.timeAgoFull()}');
  print('relative: ${date.relativeTime()}');
  print('format time: ${date.formatTime(showSeconds: true)}');
}
