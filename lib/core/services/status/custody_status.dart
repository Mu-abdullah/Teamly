import 'package:flutter/material.dart';

import '../../style/color/app_color.dart';

enum CustodyStatusEnum { settlement, notSettled, pending, rejected }

class CustodyStatus {
  static const String settled = 'settled';
  static const String notSettled = 'notSettled';
  static const String pending = 'pending';
  static const String rejected = 'rejected';

  static String getRole(CustodyStatusEnum role) => role.name;

  static Color getStatusColor(String status) {
    switch (status) {
      case notSettled:
        return AppColors.orange;
      case settled:
        return AppColors.green;
      default:
        return AppColors.red;
    }
  }
}
