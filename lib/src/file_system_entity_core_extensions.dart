import 'dart:io';

import 'package:dart_core_extensions/src/path_core_extensions.dart';

extension FileSystemEntityCoreExtensions on FileSystemEntity {
  String getName({bool withExt = true}) {
    return path.getName(withExt: withExt);
  }

  String get extName {
    return path.extName;
  }

  bool get isDirectory {
    return statSync().type == FileSystemEntityType.directory;
  }

  bool get isFile {
    return statSync().type == FileSystemEntityType.file;
  }

  Directory get getDirectory => Directory(path);
  Directory get directory => Directory(path);

  File get getFile => File(path);
  File get file => File(path);

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
