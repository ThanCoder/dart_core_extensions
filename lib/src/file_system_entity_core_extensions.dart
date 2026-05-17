import 'dart:io';

import 'package:dart_core_extensions/dart_core_extensions.dart';

/// file entity special class
extension FileSystemEntityCoreExtensions on FileSystemEntity {
  /// file name
  String getName({bool withExt = true}) {
    return path.getName(withExt: withExt);
  }

  /// ext name
  String get extName {
    return path.extName;
  }

  /// is folder
  bool get isDirectory {
    return statSync().type == FileSystemEntityType.directory;
  }

  /// is file
  bool get isFile {
    return statSync().type == FileSystemEntityType.file;
  }

  /// folder
  Directory get getDirectory => Directory(path);

  /// folder
  Directory get directory => Directory(path);

  /// file
  File get getFile => File(path);

  /// file
  File get file => File(path);

  /// The size of the file system object.
  int get size {
    return statSync().size;
  }

  /// format file size
  String fileSizeLabel({int asFixed = 2}) {
    return size.fileSizeLabel(asFixed: asFixed);
  }

  /// file size
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
