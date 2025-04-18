import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_divider.dart';
import '../widgets/build_detail_item.dart';
import '../widgets/build_info_tile.dart';
import '../widgets/name_image_position.dart';

class MobileEmpProfile extends StatelessWidget {
  const MobileEmpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NameImagePosition(),
          _buildMainInformation(),
          _infoDivider(),
          _buildProfessionalDetails(),
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

  Padding _buildMainInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuidInfoTile(title: 'الرقم الوظيفي', value: '#DEV-2204'),
          BuidInfoTile(title: 'مقر العمل', value: 'New York HQ'),
        ],
      ),
    );
  }

  Widget _buildProfessionalDetails() {
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
            value: '28 ش عين شمس، القاهرة، مصر',
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedStudentCard,
            title: 'الرقم القومي',
            value: '1234567890',
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedSmartPhone01,
            title: 'الهاتف',
            value: '01234567890',
          ),
          BuildDetailItem(
            icon: HugeIcons.strokeRoundedDateTime,
            title: 'بداية العمل',
            value: 'March 2018 (5.5 years)',
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
