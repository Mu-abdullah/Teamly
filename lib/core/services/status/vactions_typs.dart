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

  static List<String> getNamesList() {
    final List<String> types = [annual, sickLeave, maternity, exceptional];

    return types;
  }

  static const Map<String, String> _arabicTypeNames = {
    annual: 'إجازة سنوية',
    sickLeave: 'إجازة مرضية',
    maternity: 'إجازة أمومة',
    exceptional: 'إجازة استثنائية',
  };

  static List<String> getArabicTypeNamesList() =>
      getNamesList()
          .map((type) => _arabicTypeNames[type] ?? 'غير معروف')
          .toList();

  static String convertToEnglish(String type) =>
      getNamesList().firstWhere((element) => _arabicTypeNames[element] == type);
}
