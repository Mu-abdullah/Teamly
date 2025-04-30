import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/style/widgets/custom_shimmer.dart';

import '../../../../../../../core/services/get_it/git_it.dart';
import '../../../../data/repo/emp_info_repo.dart';
import '../../../cubits/emp_info_cubit/emp_info_cubit.dart';
import 'bottom_sheet_emp_info.dart';

class UserInfoBottomSheet extends StatelessWidget {
  const UserInfoBottomSheet({super.key, required this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) {
    final lac = locator<EmpInfoRepo>();
    return BlocProvider(
      create: (context) => EmpInfoCubit(lac)..getEmpInfo(uid: uid),
      child: BlocBuilder<EmpInfoCubit, EmpInfoState>(
        builder: (context, state) {
          if (state is EmpInfoLoading) {
            return _buildShimmerEffect(context);
          } else if (state is EmpInfoError) {
            return Center(child: Text(state.message));
          } else if (state is EmpInfoLoaded) {
            return BottomSheetEmpInfo(empInfo: state.empInfo);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildShimmerEffect(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomShimmer(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Shimmer for header section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar placeholder
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name placeholder
                      Container(width: 150, height: 24, color: Colors.white),
                      const SizedBox(height: 8),
                      // Status chip placeholder
                      Container(width: 80, height: 20, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Shimmer for info section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expansion tile title placeholder
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Container(
                      width: 120,
                      height: 18,
                      color: Colors.white,
                    ),
                  ),
                  // Info rows placeholders
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 14,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
