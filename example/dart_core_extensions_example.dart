// ignore_for_file: unused_local_variable
import 'package:dart_core_extensions/src/duration_eta_extensions.dart';

void main() async {
  final name = "thancoder";

  final eta = await DurationEtaExtensions.testExecutionTime(() async {
    await Future.delayed(Duration(seconds: 2));
  });

  print('eta: ${eta.toRemainingLabel()}');
}
