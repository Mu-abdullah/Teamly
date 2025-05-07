import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/status/vactions_typs.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/review_vacation_model.dart';
import '../cubits/review_vacation_cubit/review_vacation_cubit.dart';
import '../cubits/vacation_response_cubit/vacation_response_cubit.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.item});
  final ReviewVacationModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.largeRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              _buildItemRow(
                title: LangKeys.vacationType,
                value: VacationTypes.convertToArabic(item.type!),
              ),
              _buildItemRow(
                title: LangKeys.userVacationRequest,
                value: item.empId!,
              ),
              _buildItemRow(title: LangKeys.startIn, value: item.startDate!),
              _buildItemRow(title: LangKeys.endIn, value: item.endDate!),
              _buildItemRow(
                title: LangKeys.vacationReason,
                value: item.reason!,
              ),
              _buildItemRow(title: LangKeys.createdBy, value: item.userId!),

              BlocBuilder<VacationResponseCubit, VacationResponseState>(
                builder: (context, state) {
                  var cubit = VacationResponseCubit.get(context);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildReviewButton(
                        icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                        onTap: () {
                          cubit
                              .sendVacationResponse(
                                id: item.id!,
                                rejectReason: null,
                                status: VacationStatus.approved,
                              )
                              .then((onValue) {
                                if (context.mounted) {
                                  context
                                      .read<ReviewVacationCubit>()
                                      .reviewVacationRequest(
                                        context.read<AppUserCubit>().compId,
                                      );
                                }
                              });
                        },
                        backGroundColor: AppColors.green,
                      ),
                      _buildReviewButton(
                        icon: HugeIcons.strokeRoundedCancel01,
                        onTap: () {
                          cubit
                              .sendVacationResponse(
                                id: item.id!,
                                rejectReason: "حاجة العمل",
                                status: VacationStatus.rejected,
                              )
                              .then((onValue) {
                                if (context.mounted) {
                                  context
                                      .read<ReviewVacationCubit>()
                                      .reviewVacationRequest(
                                        context.read<AppUserCubit>().compId,
                                      );
                                }
                              });
                        },
                        backGroundColor: AppColors.red,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildItemRow({required String title, required String value}) {
    return Row(
      spacing: 5,
      children: [
        Expanded(flex: 1, child: AppText(title)),
        AppText(":", translate: false),
        Expanded(flex: 2, child: AppText(value, translate: false)),
      ],
    );
  }

  Widget _buildReviewButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color backGroundColor,
  }) {
    return AppButton(
      onTap: onTap,
      isCircle: true,
      icon: icon,
      backGroungColor: backGroundColor,
    );
  }
}
