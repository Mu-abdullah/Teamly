enum VacationType { annual, exceptional, sick, maternity }

enum VacationStatus { approved, rejected, pending }

class VacationUtils {
  // Arabic names for vacation types
  static const Map<VacationType, String> _arabicTypeNames = {
    VacationType.annual: 'إجازة سنوية',
    VacationType.sick: 'إجازة مرضية',
    VacationType.exceptional: 'إجازة استثنائية',
    VacationType.maternity: 'إجازة أمومة',
  };

  // Arabic names for vacation statuses
  static const Map<VacationStatus, String> _arabicStatusNames = {
    VacationStatus.approved: 'موافق عليها',
    VacationStatus.rejected: 'مرفوضة',
    VacationStatus.pending: 'معلقة',
  };

  /// Returns the Arabic name for a given vacation type.
  static String getArabicTypeName(VacationType type) =>
      _arabicTypeNames[type] ?? 'غير معروف';

  /// Returns the Arabic name for a given vacation status.
  static String getArabicStatusName(VacationStatus status) =>
      _arabicStatusNames[status] ?? 'غير معروف';

  /// Returns a list of Arabic vacation type names, excluding maternity for male users.
  static List<String> getArabicTypeNamesList() =>
      VacationType.values
          .map((type) => _arabicTypeNames[type] ?? 'غير معروف')
          .toList();
}
