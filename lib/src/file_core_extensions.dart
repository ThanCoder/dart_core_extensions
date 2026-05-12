import 'dart:io';

import 'package:dart_core_extensions/src/path_core_extensions.dart';

extension FileCoreExtensions on File {
  String getName({bool withExt = true}) {
    return path.getName(withExt: withExt);
  }

  String get extName => path.extName;

  String get parentPath => parent.path;

  bool get isDirectory {
    return statSync().type == FileSystemEntityType.directory;
  }

  bool get isFile {
    return statSync().type == FileSystemEntityType.file;
  }

  int get size {
    return statSync().size;
  }

  DateTime get modified {
    return statSync().modified;
  }
}
