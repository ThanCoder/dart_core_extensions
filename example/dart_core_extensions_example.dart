// ignore_for_file: unused_import, unused_local_variable
import 'package:dart_core_extensions/dart_core_extensions.dart';
import 'package:dart_core_extensions/src/duration_eta_extensions.dart';

void main() async {
  final name = "thancoder";

  final nowD = DateTime.now();
  final ld = nowD.copyWith(month: nowD.month - 7);

  print(ld.formatTimeAgo());
  print(ld.formatTime());
}
