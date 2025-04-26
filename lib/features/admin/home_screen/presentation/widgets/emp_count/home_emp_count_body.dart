import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/emp_count_cubit/emp_count_cubit.dart';
import 'emp_count.dart';
import 'emp_count_shimmer.dart';

class HomeEmpCountBody extends StatelessWidget {
  const HomeEmpCountBody({super.key, this.height = 270});
  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmpCountCubit, EmpCountState>(
      builder: (context, state) {
        var cubit = EmpCountCubit.get(context);
        if (state is EmpCountLoading) {
          return EmpCountShimmer();
        } else if (state is EmpCountSuccess) {
          return EmpCount(height: height, cubit: cubit);
        } else if (state is EmpCountError) {
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
