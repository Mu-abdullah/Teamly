import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import 'pervious_attendance_item.dart';
import 'pervious_attendance_listview.dart';

class PerviousAttendance extends StatefulWidget {
  const PerviousAttendance({super.key});

  @override
  State<PerviousAttendance> createState() => _PerviousAttendanceState();
}

class _PerviousAttendanceState extends State<PerviousAttendance> {
  List<int> perviousAttendance = List.generate(20, (index) => index);

  int visibleItems = 3;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void showAllItems() {
    setState(() {
      for (int i = visibleItems; i < perviousAttendance.length; i++) {
        visibleItems++;
        _listKey.currentState?.insertItem(i);
      }
    });
  }

  void showLessItems() {
    setState(() {
      // Remove items from the list with animation
      for (int i = perviousAttendance.length - 1; i >= 3; i--) {
        visibleItems--;
        _listKey.currentState?.removeItem(
          i,
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: PerviousAttendanceItem(index: perviousAttendance[i]),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.largeRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            AppSpace(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppText(LangKeys.lastAttendance, isTitle: true),
            ),
            PerviousAttendanceListview(
              listKey: _listKey,
              visibleItems: visibleItems,
              perviousAttendance: perviousAttendance,
            ),
            AppButton(
              isBorderd: visibleItems == perviousAttendance.length,
              iconColor:
                  visibleItems == perviousAttendance.length
                      ? AppColors.black
                      : AppColors.white,
              icon:
                  visibleItems == perviousAttendance.length
                      ? HugeIcons.strokeRoundedArrowUpDouble
                      : HugeIcons.strokeRoundedArrowDownDouble,
              onTap:
                  visibleItems == perviousAttendance.length
                      ? showLessItems
                      : showAllItems,
              text:
                  visibleItems == perviousAttendance.length
                      ? LangKeys.showLess
                      : LangKeys.showMore,
            ),
          ],
        ),
      ),
    );
  }
}
