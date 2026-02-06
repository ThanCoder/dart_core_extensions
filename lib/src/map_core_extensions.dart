extension MapCoreExtensions on Map {
  String getString(List<String> keys, {String def = ''}) {
    return get<String>(keys, def: def);
  }

  int getInt(List<String> keys, {int def = 0}) {
    return get<int>(keys, def: def);
  }

  double getDouble(List<String> keys, {double def = 0.0}) {
    return get<double>(keys, def: def);
  }

  bool getBool(List<String> keys, {bool def = false}) {
    return get<bool>(keys, def: def);
  }

  List<String> getStringList(List<String> keys, {List<String> def = const []}) {
    return getList<String>(keys, def: def);
  }

  List<int> getIntList(List<String> keys, {List<int> def = const []}) {
    return getList<int>(keys, def: def);
  }

  List<double> getDoubleList(List<String> keys, {List<double> def = const []}) {
    return getList<double>(keys, def: def);
  }

  List<T> getList<T>(List<String> keys, {required List<T> def}) {
    dynamic current = this;
    for (var key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return def;
      }
    }
    if (current is List<T>) {
      try {
        return current.cast<T>();
      } catch (_) {
        return def;
      }
    }
    return def;
  }

  T get<T>(List<String> keys, {required T def}) {
    dynamic current = this;
    for (var key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return def;
      }
    }
    if (current is T) {
      return current;
    }
    return def;
  }
}
