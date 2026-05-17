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

  /// The size of the file system object.
  int get size {
    return statSync().size;
  }

  Future<int> sizeAsync() async {
    return (await stat()).size;
  }

  /// The time of the last change to the data of the file system object.
  DateTime get modifiedDate {
    return statSync().modified;
  }

  /// The time of the last access to the data of the file system object.
  ///
  /// On Windows platforms, this may have 1 day granularity, and be
  /// out of date by an hour.
  DateTime get accessedDate {
    return statSync().accessed;
  }

  /// The time of the last change to the data or metadata of the file system
  /// object.
  ///
  /// On Windows platforms, this is instead the file creation time.
  DateTime get changedDate {
    return statSync().changed;
  }

  /// The mode of the file system object.
  ///
  /// Permissions are encoded in the lower 16 bits of this number, and can be
  /// decoded using the [modeString] getter.
  int get mode {
    return statSync().mode;
  }

  Future<DateTime> modifiedAsync() async {
    return (await stat()).modified;
  }
}
