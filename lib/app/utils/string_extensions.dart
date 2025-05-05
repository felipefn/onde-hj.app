
import 'regex.dart';

extension NullableStringExtension on String? {
  bool get isValidEmail => RegExp(emailRegex).hasMatch(this ?? '');

  bool isValidPhoneNumber(bool isBrazilianPhone) {
    int minLength = 10;
    int maxLength = 11;

    if (!isBrazilianPhone) {
      minLength = 5;
      maxLength = 16;
    }

    final phoneNumber = onlyDigits();
    final numberLength = phoneNumber.length;
    return minLength <= numberLength && numberLength <= maxLength;
  }

  bool matchRegex(String regex) => RegExp(regex).hasMatch(this ?? '');

  String removeDiacritics() {
    var text = this;
    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      text = text?.replaceAll(withDia[i], withoutDia[i]);
    }

    return text ?? '';
  }

  String onlyDigits() => this?.replaceAll(RegExp(r'\D'), '') ?? '';

  String removeSpecialChars() =>
      this?.replaceAll(RegExp('[^A-Za-z0-9]'), '') ?? '';

  
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');


  String getInitials([int? limitTo]) {
    if (isEmpty) return '';
    var buffer = StringBuffer();
    var split = this.split(' ');
    for (var i = 0; i < (limitTo ?? split.length); i++) {
      if (split[i].isNotEmpty) buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

  List<String> splitByLength(int pieceSize) {
    List<String> pieces = [];

    for (int i = 0; i < length; i += pieceSize) {
      int offset = i + pieceSize;
      pieces.add(substring(i, offset >= length ? length : offset));
    }
    return pieces;
  }
}
