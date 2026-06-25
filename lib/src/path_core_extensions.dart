// ignore_for_file: public_member_api_docs

import 'dart:io';

extension PathCoreExtensions on String {
  String get getNormalizeSlash => replaceAll(RegExp(r'/+'), '/');

  String get getCleanBackSlash => cleanBackSlash;

  String get cleanBackSlash {
    final cleanedPath = endsWith('/') ? substring(0, length - 1) : this;
    return cleanedPath;
  }

  /// Only Name and without .ext
  String get onlyName => getName(withExt: false);

  String getName({bool withExt = true}) {
    // replace // -> /
    final oneSlash = getNormalizeSlash;
    // clean end -> /
    final cleanedPath = oneSlash.endsWith('/')
        ? oneSlash.substring(0, oneSlash.length - 1)
        : oneSlash;
    final name = cleanedPath.split(Platform.pathSeparator).last;
    if (!withExt) {
      return name.split('.').first;
    }
    return name;
  }

  String get extName {
    final list = split('.');
    if (list.isEmpty) return this;
    return list.last;
  }

  String pathJoin(String name) {
    return '$cleanBackSlash${Platform.pathSeparator}$name';
  }

  String join(String path) {
    return '$cleanBackSlash${Platform.pathSeparator}$path';
  }
}
