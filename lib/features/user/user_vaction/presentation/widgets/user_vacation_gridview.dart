import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/status/gender_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../../admin/home_screen/presentation/widgets/emp_count/home_card.dart';
import '../cubits/user_check_vacation_cubit/user_check_vacation_cubit.dart';

class VacationCardsGridView extends StatelessWidget {
  const VacationCardsGridView({super.key, required this.cubit});
  final UserCheckVacationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 16 / 10,
              children: _buildCards(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    return [
      _buildHomeCard(
        context,
        title: LangKeys.newRequest,
        icon: HugeIcons.strokeRoundedTask01,
        color: AppColors.darkGrey,
        onTap: () => _handleNewRequestTap(context),
      ),
      _buildHomeCard(
        context,
        title: LangKeys.myRequests,
        icon: HugeIcons.strokeRoundedTaskDone01,
        color: AppColors.blueAccent,
        count: cubit.requests!.length.toString(),
        onTap: () => context.pushNamed(RoutesNames.userVacationsRequests),
      ),
      _buildHomeCard(
        context,
        title: LangKeys.annuallVacation,
        icon: HugeIcons.strokeRoundedBeach,
        color: AppColors.green,
        count: cubit.getAnnual().length.toString(),
      ),
      _buildHomeCard(
        context,
        title: LangKeys.sickLeave,
        icon: HugeIcons.strokeRoundedStethoscope,
        color: AppColors.black,
        count: cubit.getSickLeave().length.toString(),
      ),
      _buildHomeCard(
        context,
        title: LangKeys.exceptionalVacation,
        icon: HugeIcons.strokeRoundedWorkAlert,
        color: AppColors.yellow,
        count: cubit.getExceptional().length.toString(),
      ),
      if (cubit.gender == GenderStatus.getGender(Gender.female))
        _buildHomeCard(
          context,
          title: LangKeys.maternityLeave,
          icon: HugeIcons.strokeRoundedWoman,
          color: AppColors.pink,
          count: cubit.getMaternity().length.toString(),
        ),
    ];
  }

  HomeCard _buildHomeCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    String? count,
    VoidCallback? onTap,
  }) {
    return HomeCard(
      onTap: onTap,
      cardTitle: title,
      cardIcon: icon,
      isHighlighted: true,
      color: color,
      height: 150,
      cardCount: count,
    );
  }

  void _handleNewRequestTap(BuildContext context) {
    if (cubit.getPending().isNotEmpty) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: LangKeys.youHaveRequest,
        backgroundColor: AppColors.red,
      );
    } else {
      context.pushNamed(
        RoutesNames.userNewVacationRequests,
        arguments: {'gender': cubit.gender},
      );
    }
  }
}
