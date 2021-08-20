extension StringExtension on String {
  /// null,空文字,半角・全角スペースだけのパターンをチェック
  bool isNotBlank() => trim().isNotEmpty;

  bool isBlank() => !isNotBlank();
}
