import 'gender_status.dart';

class VacationStatus {
  static const String approved = 'approved';
  static const String pending = 'pending';
  static const String rejected = 'rejected';
}

class VacationTypes {
  static const String annual = 'annual';
  static const String sickLeave = 'sick';
  static const String maternity = 'maternity';
  static const String exceptional = 'exceptional';

  static List<String> getNamesList({String? gender}) {
    final List<String> types = [annual, sickLeave, maternity, exceptional];
    if (gender == GenderStatus.getGender(Gender.male)) {
      return types.where((type) => type != maternity).toList();
    }
    return types;
  }

  static const Map<String, String> _arabicTypeNames = {
    annual: 'إجازة سنوية',
    sickLeave: 'إجازة مرضية',
    exceptional: 'إجازة استثنائية',
    maternity: 'إجازة أمومة',
  };

  static List<String> getArabicTypeNamesList({String? gender}) =>
      getNamesList(
        gender: gender,
      ).map((type) => _arabicTypeNames[type] ?? 'غير معروف').toList();

  static String convertToEnglish(String type) =>
      getNamesList().firstWhere((element) => _arabicTypeNames[element] == type);
}
