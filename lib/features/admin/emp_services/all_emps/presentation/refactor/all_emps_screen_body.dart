import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_all_emp_cubit/get_all_emp_cubit.dart';
import '../widgets/all_emps_listview.dart';
import '../widgets/loading_emps.dart';

class AllEmpsScreenBody extends StatelessWidget {
  const AllEmpsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllEmpCubit, GetAllEmpState>(
      builder: (context, state) {
        if (state is GetAllEmpLoading) {
          return LoadingEmps();
        } else if (state is GetAllEmpSuccess) {
          return AllEmpsListView(empList: state.empList);
        } else if (state is GetAllEmpError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
