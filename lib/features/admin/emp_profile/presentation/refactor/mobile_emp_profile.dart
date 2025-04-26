import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_divider.dart';
import '../../../../auth/data/models/emp_model.dart';
import '../cubits/user_profile_cubit/user_profile_cubit.dart';
import '../widgets/build_detail_item.dart';
import '../widgets/build_info_tile.dart';
import '../widgets/name_image_position.dart';

class MobileEmpProfile extends StatelessWidget {
  const MobileEmpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserProfileLoaded) {
          return _buildProfileDetails(context, state.user);
        } else if (state is UserProfileError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }

  Widget _buildProfileDetails(BuildContext context, EmpModel user) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          NameImagePosition(user: user),
          const SizedBox(height: 20),
          _buildMainInformation(user),
          _infoDivider(),
          _buildProfessionalDetails(user),
        ],
      ),
    );
  }

  Padding _infoDivider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomDivider(color: AppColors.darkGrey, thickness: 0.5),
    );
  }

  Padding _buildMainInformation(EmpModel user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuidInfoTile(title: 'الرقم الوظيفي', value: user.id!),
          BuidInfoTile(title: 'مقر العمل', value: user.position!),
        ],
      ),
    );
  }

  Widget _buildProfessionalDetails(EmpModel user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          AppText('المعلومات الشخصية', isTitle: true, translate: false),

          BuildDetailItem(
            icon: HugeIcons.strokeRoundedLocation01,
            title: 'العنوان',
            value: user.address!,
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedStudentCard,
            title: 'الرقم القومي',
            value: user.nid!,
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedSmartPhone01,
            title: 'الهاتف',
            value: user.phone!,
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedDateTime,
            title: 'بداية العمل',
            value: user.startIn!,
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedDateTime,
            title: 'نهاية العمل',
            value: 'مستمر بالخدمة',
          ),
        ],
      ),
    );
  }
}
