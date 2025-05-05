

enum Gender {
  womanCis('FC'),
  womanTrans('FT'),
  manCis('MC'),
  manTrans('MT'),
  nonBinary('NB'),
  other('O');

  const Gender(this.id);
  final String id;

  // static Gender? getGenderFromLabel(String label) {
  //   return Gender.values.firstWhereOrNull((element) => element.label == label);
  // }

  // static Gender? getGenderFromId(String id) {
  //   return Gender.values.firstWhereOrNull((element) => element.id == id);
  // }
}


