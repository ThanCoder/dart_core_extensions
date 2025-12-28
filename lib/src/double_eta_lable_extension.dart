extension DoubleEtaLableExtension on double {
  String formatautoSpeedLabel() {
    if (this == 0) {
      return '';
    }
    if (this >= 1024 * 1024 * 1024) {
      return '${(this / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB/s';
    } else if (this >= 1024 * 1024) {
      return '${(this / (1024 * 1024)).toStringAsFixed(2)} MB/s';
    } else if (this >= 1024) {
      return '${(this / 1024).toStringAsFixed(2)} KB/s';
    } else {
      return '${toStringAsFixed(0)} B/s';
    }
  }
}
