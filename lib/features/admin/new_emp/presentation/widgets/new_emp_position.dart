import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/style/widgets/custom_shimmer.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_drop_menu.dart';
import '../../data/model/new_emp_positions_model.dart';
import '../cubits/new_emp_cubit/new_emp_cubit.dart';
import '../cubits/new_emp_position_cubit/new_emp_position_cubit.dart';

class NewEmpPosition extends StatelessWidget {
  const NewEmpPosition({super.key, required this.cubit});

  final NewEmpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewEmpPositionCubit, NewEmpPositionState>(
      builder: (context, state) {
        if (state is NewEmpPositionLoaded) {
          return Row(
            spacing: 10,
            children: [
              Icon(HugeIcons.strokeRoundedOfficeChair),
              Expanded(
                child: GenericDropdown(
                  items: state.positions,
                  getDisplayText:
                      (NewEmpPositionsModel value) => value.positionName!,
                  onChanged: (v) {
                    if (v != null) {
                      cubit.positionId = v.id!;
                      debugPrint(cubit.positionId);
                    }
                  },
                  hint: LangKeys.position,
                ),
              ),
            ],
          );
        } else if (state is NewEmpPositionError) {
          return Center(child: AppText(state.message, translate: false));
        } else if (state is NewEmpPositionLoading) {
          return const CustomShimmer(child: AppText(LangKeys.loading));
        } else {
          return Container();
        }
      },
    );
  }
}
