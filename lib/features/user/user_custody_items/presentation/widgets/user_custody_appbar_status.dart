import 'package:flutter/material.dart';

import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';

class UserCustodyAppBarStatus extends StatelessWidget {
  const UserCustodyAppBarStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: CustodyStatus.getStatusColor(status),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: AppText(status, color: AppColors.white, fontSize: 11),
        ),
      ),
    );
  }
}
