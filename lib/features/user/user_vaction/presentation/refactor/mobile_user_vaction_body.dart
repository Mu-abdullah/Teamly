import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/style/widgets/custom_shimmer.dart';
import 'package:teamly/core/style/widgets/custom_snack_bar.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/status/gender_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../admin/home_screen/presentation/widgets/emp_count/home_card.dart';
import '../cubits/user_check_vacation_cubit/user_check_vacation_cubit.dart';

class MobileUserVactionsBody extends StatelessWidget {
  const MobileUserVactionsBody({super.key, required this.gender});
  final String gender;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCheckVacationCubit, UserCheckVacationState>(
      builder: (context, state) {
        if (state is UserCheckVacationLoading) {
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
                    children: List.generate(
                      6,
                      (index) => CustomShimmer(
                        child: HomeCard(
                          cardTitle: LangKeys.maternityLeave,
                          cardIcon: HugeIcons.strokeRoundedWoman,
                          color: AppColors.pink,
                          isHighlighted: true,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is UserCheckVacationLoaded) {
          final List<Widget> cards = [
            HomeCard(
              onTap: () {
                if (state.requests.isNotEmpty) {
                  CustomSnackbar.showTopSnackBar(
                    context,
                    message: LangKeys.youHaveRequest,
                    backgroundColor: AppColors.red,
                  );
                } else {
                  context.pushNamed(
                    RoutesNames.userNewVacationRequests,
                    arguments: {'gender': gender},
                  );
                }
              },
              cardTitle: LangKeys.newRequest,
              cardIcon: HugeIcons.strokeRoundedTask01,
              isHighlighted: true,
              color: AppColors.darkGrey,
              height: 150,
            ),
            HomeCard(
              onTap: () {
                context.pushNamed(RoutesNames.userVacationsRequests);
              },
              cardTitle: LangKeys.myRequests,
              cardIcon: HugeIcons.strokeRoundedTaskDone01,
              isHighlighted: true,
              color: AppColors.blueAccent,
              height: 150,
            ),
            HomeCard(
              cardTitle: LangKeys.annuallVacation,
              cardIcon: HugeIcons.strokeRoundedBeach,
              isHighlighted: true,
              color: AppColors.green,
              height: 150,
            ),
            HomeCard(
              cardTitle: LangKeys.sickLeave,
              cardIcon: HugeIcons.strokeRoundedStethoscope,
              color: AppColors.black,
              isHighlighted: true,
              height: 150,
            ),
            HomeCard(
              cardTitle: LangKeys.exceptionalVacation,
              cardIcon: HugeIcons.strokeRoundedWorkAlert,
              color: AppColors.yellow,
              isHighlighted: true,
              height: 150,
            ),
            if (gender == GenderStatus.getGender(Gender.female))
              HomeCard(
                cardTitle: LangKeys.maternityLeave,
                cardIcon: HugeIcons.strokeRoundedWoman,
                color: AppColors.pink,
                isHighlighted: true,
                height: 150,
              ),
          ];
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
                    children: cards,
                  ),
                ),
              ],
            ),
          );
        } else if (state is UserCheckVacationError) {
          return Center(child: AppText(state.error));
        }
        return Container();
      },
    );
  }
}
