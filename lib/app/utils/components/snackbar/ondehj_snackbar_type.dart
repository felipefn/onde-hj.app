import '../../design/colors.dart';

enum OndeHjSnackbarType {
  positive,
  negative,
}

extension GirassolBadgeTypeExtension on OndeHjSnackbarType {
  get backgroundColor {
    switch (this) {
      case OndeHjSnackbarType.positive:
        return OndeHjColors.bambooOriginal;
      case OndeHjSnackbarType.negative:
        return OndeHjColors.rubyOriginal;
    }
  }
}
