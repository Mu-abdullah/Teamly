import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/get_custody.dart';
import '../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../refactor/custody_body.dart';
import '../widgets/custody_app_bar.dart';

class CustodyScreen extends StatelessWidget {
  const CustodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lac = locator<GetCustodyRepo>();
    return BlocProvider(
      create: (context) => GetCustodyCubit(lac)..fetchCustody(),
      child: Scaffold(appBar: CustodyAppBar(), body: CustodyBody()),
    );
  }
}
