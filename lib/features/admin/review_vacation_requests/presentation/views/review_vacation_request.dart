import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/response_vacation_repo.dart';
import '../../data/repo/review_vacation_repo.dart';
import '../cubits/review_vacation_cubit/review_vacation_cubit.dart';
import '../cubits/vacation_response_cubit/vacation_response_cubit.dart';
import '../refactor/review_vacation_reqeust_body.dart';

class ReviewVacationRequest extends StatelessWidget {
  const ReviewVacationRequest({super.key});

  @override
  Widget build(BuildContext context) {
    final compID = context.read<AppUserCubit>().compId;
    final lac = locator<ReviewVacationRepo>();
    final lac2 = locator<ResponseVacationRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  ReviewVacationCubit(lac)..reviewVacationRequest(compID),
        ),
        BlocProvider(create: (context) => VacationResponseCubit(lac2)),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.reviewVacationRequest),
        body: ReviewVacationRequestBody(),
      ),
    );
  }
}
