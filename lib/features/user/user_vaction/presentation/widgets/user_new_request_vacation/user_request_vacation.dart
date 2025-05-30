import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../data/repo/submit_vacation_request_repo.dart';
import '../../cubits/new_request_vacation_cubit/new_request_vacation_cubit.dart';
import 'user_new_request_vacation_body.dart';

class UserRequestVacation extends StatelessWidget {
  const UserRequestVacation({super.key, required this.gender});
  final String gender;
  @override
  Widget build(BuildContext context) {
    final lac = locator<SubmitVacationRequestRepo>();
    return BlocProvider(
      create: (context) => NewRequestVacationCubit(gender: gender, repo: lac),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.vacationRequest),
        body: UserNewRequestVacationBody(),
      ),
    );
  }
}
