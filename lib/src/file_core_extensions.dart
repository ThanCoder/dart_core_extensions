import 'dart:io';

import 'package:dart_core_extensions/src/string_path_extensions.dart';

extension FileCoreExtensions on File {
  String getName({bool withExt = true}) {
    return path.getName(withExt: withExt);
  }

  String get extName {
    return path.extName;
  }

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

  Future<int> sizeAsync() async {
    return (await stat()).size;
  }

  DateTime get modified {
    return statSync().modified;
  }

  Future<DateTime> modifiedAsync() async {
    return (await stat()).modified;
  }
}
