extension StringExtensions on String {
  String titleCase() {
    if (length <= 1) {
      return toUpperCase();
    }
    final words = toLowerCase().split(' ');
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final firstLetter = word.trim().substring(0, 1).toUpperCase();
        final remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    return capitalizedWords.join(' ');
  }
}
