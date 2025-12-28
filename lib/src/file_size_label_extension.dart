import 'dart:io';

import 'package:dart_core_extensions/src/double_size_label_extension.dart';

extension FileSizeLabelExtension on File {
  String fileSizeLabel({int asFixed = 2}) {
    return statSync().size.toDouble().fileSizeLabel(asFixed: asFixed);
  }
}
