import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/home_emp_model.dart';

class HomeEmpItem extends StatelessWidget {
  const HomeEmpItem({super.key, required this.emp});
  final HomeEmpModel emp;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: InkWell(
        onTap: () {
          context.pushNamed(
            RoutesNames.empProfileScreen,
            arguments: {'id': emp.id},
          );
        },
        child: Container(
          width: context.width(percent: 0.7),
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
                  padding: const EdgeInsets.only(
                    left: 120,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 4,
                    children: [
                      AppText(
                        emp.position!,
                        isTitle: true,
                        translate: false,
                      ),
                      AppText(emp.name!, fontSize: 12, translate: false),
                      AppText(emp.phone!, fontSize: 12, translate: false),
                      AppText(emp.id!, fontSize: 12, translate: false),
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
