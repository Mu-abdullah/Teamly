import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/review_vacation_repo.dart';
import '../cubits/cubit/review_vacation_cubit.dart';
import '../widgets/review_listview.dart';

class ReviewVacationRequest extends StatelessWidget {
  const ReviewVacationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final compID = context.read<AppUserCubit>().compId;
    final lac = locator<ReviewVacationRepo>();
    return BlocProvider(
      create:
          (context) => ReviewVacationCubit(lac)..reviewVacationRequest(compID),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.reviewVacationRequest),
        body: BlocBuilder<ReviewVacationCubit, ReviewVacationState>(
          builder: (context, state) {
            if (state is ReviewVacationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReviewVacationLoaded) {
              if (state.reviewVacationList.isEmpty) {
                return AppText(LangKeys.noVacationRequests);
              } else {
                return ReviewListView(vacations: state.reviewVacationList);
              }
            } else if (state is ReviewVacationError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
