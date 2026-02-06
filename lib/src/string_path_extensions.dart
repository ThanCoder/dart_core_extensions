import 'dart:io';

extension StringPathExtensions on String {
  String get getNormalizeSlash => replaceAll(RegExp(r'/+'), '/');

  String get getCleanBackSlash {
    final cleanedPath = endsWith('/') ? substring(0, length - 1) : this;
    return cleanedPath;
  }

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
    return '$getCleanBackSlash${Platform.pathSeparator}$name';
  }
}
