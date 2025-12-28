import 'package:dart_core_extensions/src/double_size_label_extension.dart';

extension IntSizeLabelExtension on int {
  String fileSizeLabel({int asFixed = 2}) {
    return toDouble().fileSizeLabel(asFixed: asFixed);
  }
}
