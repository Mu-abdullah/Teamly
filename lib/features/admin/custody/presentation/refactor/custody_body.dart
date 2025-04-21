import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../widgets/custody_item.dart';

class CustodyBody extends StatelessWidget {
  const CustodyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCustodyCubit, GetCustodyState>(
      builder: (context, state) {
        if (state is CustodyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CustodyLoaded) {
          return ListView.separated(
            itemCount: state.custody.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder:
                (context, index) =>
                    CustodyItem(custody: state.custody[index], showMore: true),
          );
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
