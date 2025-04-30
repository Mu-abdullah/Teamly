import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/routes/routes_name.dart';

import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/services/status/user_role.dart';
import '../../data/repo/check_role_repo.dart';
import '../cubit/check_role_cubit/check_role_cubit.dart';

class CheckRole extends StatelessWidget {
  const CheckRole({super.key, required this.mail});
  final String mail;

  @override
  Widget build(BuildContext context) {
    final lac = locator<CheckRoleRepo>();
    return BlocProvider(
      create: (context) => CheckRoleCubit(repo: lac, email: mail)..checkRole(),
      child: BlocConsumer<CheckRoleCubit, CheckRoleState>(
        listener: (context, state) {
          if (state is CheckRoleLoaded) {
            if (state.role.role == UserRole.getRole(Role.admin)) {
              context.pushNamedAndRemoveUntil(RoutesNames.homeScreen);
            } else if (state.role.role == UserRole.getRole(Role.user)) {
              context.pushNamedAndRemoveUntil(RoutesNames.userHomeScreen);
            }
          }
        },
        builder: (context, state) {
          if (state is CheckRoleLoading) {
            return _buildShimmerLoading();
          } else if (state is CheckRoleError) {
            return _buildError(context, state.message);
          }
          return _buildInitialLoading();
        },
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(width: 200, height: 20, color: Colors.grey),
                  const SizedBox(height: 10),
                  Container(width: 150, height: 15, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String errorMessage) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: $errorMessage',
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<CheckRoleCubit>().checkRole(),
              child: const Text('Retry Check'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialLoading() {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
