import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_new_emp_position.dart';
import '../../data/repo/upload_emp_info_to_supabase.dart';
import '../cubits/images_cubit/get_image_cubit.dart';
import '../cubits/new_emp_form_cubit/new_emp_form_cubit.dart';
import '../cubits/new_emp_position_cubit/new_emp_position_cubit.dart';
import '../cubits/upload_new_emp_data_cubit/upload_new_emp_data_cubit.dart';
import '../refactor/new_emp_screen_body.dart';

class NewEmpScreen extends StatelessWidget {
  const NewEmpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var comp = context.read<AppUserCubit>().compId;
    final lac = locator<GetNewEmpPosition>();
    final lac2 = locator<UploadEmpInfoToSupabase>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewEmpFormCubit(lac2)),
        BlocProvider(create: (context) => UploadNewEmpDataCubit(lac2)),
        BlocProvider(create: (context) => GetImageCubit()),
        BlocProvider(
          create:
              (context) =>
                  NewEmpPositionCubit(lac)..getNewEmpPosition(compId: comp),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.newEmp),
        body: NewEmpScreenBody(),
      ),
    );
  }
}
