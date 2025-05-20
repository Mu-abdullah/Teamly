import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../auth/data/models/emp_model.dart';

class NameImagePosition extends StatelessWidget {
  const NameImagePosition({super.key, required this.user});
  final EmpModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        spacing: 8,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.image ?? ImageTest.bloger),
                fit: BoxFit.cover,
              ),
            ),
          ),

          AppText(user.name!, isTitle: true, translate: false, maxLines: 5),
          Row(
            children: [
              Expanded(
                child: AppText(
                  user.position!,
                  textAlign: TextAlign.start,
                  translate: false,
                ),
              ),
              user.papers != null && user.papers!.isNotEmpty
                  ? AppButton(
                    isCircle: true,
                    icon: HugeIcons.strokeRoundedPdf01,
                    backGroungColor: AppColors.blueBlack,
                    onTap: () {
                      context.pushNamed(
                        RoutesNames.paperViewer,
                        arguments: {'url': user.papers},
                      );
                    },
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
