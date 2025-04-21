import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/widgets/app_text.dart';
import '../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../widgets/custody/custody_item.dart';
import '../widgets/custody/custody_listview.dart';

class CustodyBody extends StatelessWidget {
  const CustodyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCustodyCubit, GetCustodyState>(
      builder: (context, state) {
        if (state is CustodyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CustodyLoaded) {
          if (state.custody.isEmpty) {
            return const Center(
              child: AppText('No custody available', translate: false),
            );
          } else if (state.custody.length == 1) {
            return CustodyItem(custody: state.custody.first);
          } else {
            return CustodyListview(custodyList: state.custody);
          }
        } else if (state is CustodyError) {
          return Center(
            child: Text(
              state.error.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
