

enum Nationality {
  brazilian('BR', 1),
  foreign('UN', 2);

  const Nationality(
    this.id,
    this.documentId,
  );

  final String id;
  final int documentId;

  // static Nationality getNationalityFromLabel(String label) {
  //   return Nationality.values.firstWhere(
  //     (element) => element.label == label,
  //     orElse: () => Nationality.brazilian,
  //   );
  // }

  // static Nationality? getNationalityFromId(String id) {
  //   return Nationality.values.firstWhereOrNull(
  //     (element) => element.id == id,
  //   );
  // }
}

// extension NationalitiesExtension on Nationality {
//   static final localization = AuthenticatorModuleLocalizations().signUp;
//   String get label {
//     switch (this) {
//       case Nationality.brazilian:
//         return localization.authenticatorBrazilianUserOption;
//       case Nationality.foreign:
//         return localization.authenticatorForeignUserOption;
//     }
//   }

//   String get documentLabel {
//     switch (this) {
//       case Nationality.brazilian:
//         return localization.authenticatorBrazilianUserDocument;
//       case Nationality.foreign:
//         return localization.authenticatorForeignUserDocument;
//     }
//   }

//   List<TextInputFormatter> get documentFormatters {
//     if (this == Nationality.foreign) return [];
//     return [CPFInputFormatter(), LengthLimitingTextInputFormatter(14)];
//   }
// }
