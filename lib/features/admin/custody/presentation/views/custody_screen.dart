import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/features/admin/custody/data/repo/add_custody.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../custody_transaction/data/repo/satteled_repo.dart';
import '../../data/repo/get_custody.dart';
import '../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../cubits/settled_custody_cubit/settled_custody_cubit.dart';
import '../refactor/custody_body.dart';
import '../widgets/custody_app_bar.dart';

class CustodyScreen extends StatelessWidget {
  const CustodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => GetCustodyCubit(
                locator<GetCustodyRepo>(),
                locator<AddCustodyRepo>(),
              )..fetchCustody(context.read<AppUserCubit>().compId),
        ),
        BlocProvider(create: (context) => SettledCustodyCubit(locator<SatteledRepo>())),
      ],
      child: const Scaffold(appBar: CustodyAppBar(), body: CustodyBody()),
    );
  }
}
