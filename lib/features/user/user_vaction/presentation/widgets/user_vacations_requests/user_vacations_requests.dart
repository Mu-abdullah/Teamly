import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../data/repo/get_user_vacations_requests_repo.dart';
import '../../cubits/user_vacation_requests_cubit/user_vacation_requests_cubit.dart';
import 'requests_loading.dart';
import 'user_vacations_requests_listview.dart';

class UserVacationsRequests extends StatelessWidget {
  const UserVacationsRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final lac = locator<GetUserVacationsRequestsRepo>();
    var emp = context.read<AppUserCubit>().userId;
    return BlocProvider(
      create:
          (context) =>
              UserVacationRequestsCubit(lac)..getVacationRequests(empid: emp),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.myRequests),
        body: BlocBuilder<UserVacationRequestsCubit, UserVacationRequestsState>(
          builder: (context, state) {
            if (state is UservacationRequestsLoadedState) {
              if (state.requests.isNotEmpty) {
                return UserVacationListview(requests: state.requests);
              } else {
                return Center(child: AppText(LangKeys.noVacationRequests));
              }
            } else if (state is UservacationRequestsLoading) {
              return RequestsLoadingShimmer();
            } else if (state is UservacationRequestsErrorState) {
              return Center(child: AppText(state.error, translate: false));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
