import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/services/status/job_status.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../data/model/all_emp_model.dart';

class AllEmpsItem extends StatelessWidget {
  const AllEmpsItem({super.key, required this.emp});

  final AllEmpModel emp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.mediumRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  emp.image != null
                      ? NetworkImage(emp.image!)
                      : const AssetImage(AppImages.logo) as ImageProvider,
            ),
            Expanded(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(translate: false, emp.name!),
                      InkWell(
                        onTap: () {
                          if (emp.phone != null && emp.phone!.isNotEmpty) {
                            context.call(phoneNumber: emp.phone!);
                          } else {
                            CustomSnackbar.showTopSnackBar(
                              context,
                              message: LangKeys.error,
                              backgroundColor: AppColors.red,
                            );
                          }
                        },
                        child: Icon(
                          HugeIcons.strokeRoundedCalling02,
                          color: AppColors.blueAccent,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        translate: false,
                        emp.position!,
                        color: AppColors.darkGrey,
                      ),
                      AppText(translate: false, emp.phone!),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        JobStatus.jobStatus(emp.jobStatus!),
                        color: JobStatus.statusColor(emp.jobStatus!),
                      ),
                      if (emp.endIn != null)
                        AppText(translate: false, emp.endIn!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
