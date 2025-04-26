import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/user_profile_repo.dart';
import '../cubits/user_profile_cubit/user_profile_cubit.dart';
import '../refactor/mobile_emp_profile.dart';

class EmpProfile extends StatelessWidget {
  const EmpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(UserProfileRepo()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Employee Profile', translate: false),
        body: MobileEmpProfile(),
      ),
    );
  }
}
