import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/loading_shimmer_widget.dart';
import '../cubits/review_vacation_cubit/review_vacation_cubit.dart';
import '../widgets/review_listview.dart';

class ReviewVacationRequestBody extends StatelessWidget {
  const ReviewVacationRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewVacationCubit, ReviewVacationState>(
      builder: (context, state) {
        if (state is ReviewVacationLoading) {
          return LoadingShimmer();
        } else if (state is ReviewVacationLoaded) {
          if (state.reviewVacationList.isEmpty) {
            return Center(
              child: AppText(LangKeys.noVacationRequests, isTitle: true),
            );
          } else {
            return ReviewListView(vacations: state.reviewVacationList);
          }
        } else if (state is ReviewVacationError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
