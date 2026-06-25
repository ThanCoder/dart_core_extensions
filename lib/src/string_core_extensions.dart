// ignore_for_file: public_member_api_docs

extension StringCoreExtensions on String {
  String get toCaptalize {
    if (trim().isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1, length)}';
  }

  String toCaptalizeWords({String splitKey = ' '}) {
    if (trim().isEmpty) return this;
    List<String> words = split(
      splitKey,
    ).where((e) => e.isNotEmpty).map((e) => e.toCaptalize).toList();
    return words.join(splitKey);
  }
}
