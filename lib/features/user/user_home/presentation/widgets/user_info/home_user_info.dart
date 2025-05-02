import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../../data/model/user_home_model.dart';
import 'bottom_sheet/user_info_bottom_sheet.dart';

class HomeUserInfo extends StatelessWidget {
  const HomeUserInfo({super.key, required this.isArabic, required this.user});

  final bool isArabic;
  final UserHomeModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customShowBottomSheet(
          context: context,
          isScrollControlled: false,
          builder: (context) => UserInfoBottomSheet(uid: user.id!),
        );
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          width: context.width(percent: 0.8),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -10,
                left: isArabic ? 25 : null,
                right: isArabic ? null : 25,
                child: InkWell(
                  onTap: () {
                    context.pushNamed(
                      RoutesNames.imagePreview,
                      arguments: {'imageUrl': ImageTest.bloger},
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 150,
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
              ),

              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              user.name!,
                              isTitle: true,
                              maxLines: 3,
                              translate: false,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),

                      AppText(user.phone!, fontSize: 12, translate: false),
                      AppText(user.position!, fontSize: 12, translate: false),
                      AppText(user.id!, fontSize: 12, translate: false),
                      AppSpace(space: 5),
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
