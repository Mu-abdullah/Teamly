import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../admin/home_screen/presentation/widgets/emp_count/home_card.dart';
import '../cubits/get_user_data_cubit/get_user_data_cubit.dart';

class CustodySalaryVacationCards extends StatelessWidget {
  const CustodySalaryVacationCards({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 100;
    const EdgeInsets containerMargin = EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    );
    const EdgeInsets contentPadding = EdgeInsets.all(8.0);

    return Container(
      margin: containerMargin,
      decoration: _containerDecoration(),
      child: Padding(
        padding: contentPadding,
        child: Column(
          spacing: 8,
          children: [
            _buildHomeCard(
              title: LangKeys.custody,
              icon: HugeIcons.strokeRoundedDollar01,
              color: AppColors.blueBlack,
              height: cardHeight,
            ),

            _buildBottomRow(context, cardHeight),
          ],
        ),
      ),
    );
  }

  BoxDecoration _containerDecoration() => BoxDecoration(
    color: AppColors.white,
    borderRadius: AppBorderRadius.largeRadius,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  Widget _buildBottomRow(BuildContext context, double height) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: _buildHomeCard(
            title: LangKeys.vacation,
            icon: HugeIcons.strokeRoundedBeach,
            height: height,
            onTap: () => _handleVacationTap(context),
          ),
        ),

        Expanded(
          child: _buildHomeCard(
            title: LangKeys.salary,
            icon: HugeIcons.strokeRoundedCoinsDollar,
            color: AppColors.green,
            height: height,
          ),
        ),
      ],
    );
  }

  HomeCard _buildHomeCard({
    required String title,
    required IconData icon,
    Color? color,
    double? height,
    VoidCallback? onTap,
  }) {
    return HomeCard(
      onTap: onTap,
      cardTitle: title,
      cardIcon: icon,
      isHighlighted: true,
      color: color ?? AppColors.black,
      height: height ?? 100,
    );
  }

  void _handleVacationTap(BuildContext context) {
    final gender = context.read<GetUserDataCubit>().user!.gend!.name;
    context.pushNamed(RoutesNames.userVacation, arguments: {'gender': gender});
  }
}
