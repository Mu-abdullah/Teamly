enum CustodyStatusEnum { settlement, notSettled, pending, rejected }

class CustodyStatus {
  static const String settlement = 'settlement';
  static const String notSettled = 'notSettled';
  static const String pending = 'pending';
  static const String rejected = 'rejected';

  static String getRole(CustodyStatusEnum role) => role.name;
}
