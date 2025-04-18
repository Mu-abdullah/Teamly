import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/routes/routes_name.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class HomeEmpItem extends StatelessWidget {
  const HomeEmpItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: InkWell(
        onTap: () {
          context.pushNamed(RoutesNames.empProfileScreen);
        },
        child: Container(
          width: context.width(percent: 0.8),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.scaffoldBackground,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -10,
                left: 25,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.black, width: 3),
                    image: DecorationImage(
                      image: NetworkImage(ImageTest.bloger),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      AppText('محمد احمد', isTitle: true, translate: false),
                      SizedBox(height: 4),
                      AppText('مدير عام', fontSize: 12, translate: false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
