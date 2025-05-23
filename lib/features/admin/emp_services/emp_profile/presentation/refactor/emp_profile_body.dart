import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../auth/data/models/emp_model.dart';
import '../cubits/user_profile_cubit/user_profile_cubit.dart';
import '../widgets/profile_background_decoration.dart';
import '../widgets/web_tablet/tab_layput.dart';
import '../widgets/web_tablet/wide_screen.dart';
import 'emp_mobile_profile.dart';

class EmpProfileBody extends StatelessWidget {
  const EmpProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoaded) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 1200;
              final isMediumScreen = constraints.maxWidth > 768;
              final isMobile = constraints.maxWidth < 768;
              return Container(
                decoration: const ProfileBackgroundDecoration(),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWideScreen ? 40 : (isMediumScreen ? 24 : 16),
                    vertical: 20,
                  ),
                  child: _buildLayout(
                    user: state.user,
                    isWideScreen: isWideScreen,
                    isMobile: isMobile,
                  ),
                ),
              );
            },
          );
        } else if (state is UserProfileError) {
          return Center(child: AppText(state.message));
        } else {
          return const Center(child: AppText(LangKeys.error));
        }
      },
    );
  }

  Widget _buildLayout({
    required EmpModel user,
    required bool isWideScreen,
    required bool isMobile,
  }) {
    if (isWideScreen) {
      return WideScreenLayout(user: user);
    } else if (isMobile) {
      return EmpMobileProfile(user: user);
    } else {
      return TabletProfileLayout(user: user);
    }
  }
}

// EmpMobileProfile(user: state.user);
