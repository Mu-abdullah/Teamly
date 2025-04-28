import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/history_attendance_model.dart';
import '../../cubits/attendance_history_cubit/attendance_history_cubit.dart';
import 'hostory_loading.dart';
import 'pervious_attendance_item.dart';
import 'pervious_attendance_listview.dart';

class PerviousAttendance extends StatefulWidget {
  const PerviousAttendance({super.key});

  @override
  State<PerviousAttendance> createState() => _PerviousAttendanceState();
}

class _PerviousAttendanceState extends State<PerviousAttendance> {
  List<HistoryAttendanceModel> perviousAttendance = [];
  int visibleItems = 0;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void showAllItems() {
    final totalItems = perviousAttendance.length;
    for (int i = visibleItems; i < totalItems; i++) {
      _listKey.currentState?.insertItem(i);
    }
    setState(() {
      visibleItems = totalItems;
    });
  }

  void showLessItems() {
    for (int i = visibleItems - 1; i >= 3; i--) {
      _listKey.currentState?.removeItem(
        i,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: PerviousAttendanceItem(item: perviousAttendance[i]),
        ),
      );
    }
    setState(() {
      visibleItems = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceHistoryCubit, AttendanceHistoryState>(
      listener: (context, state) {
        if (state is HistoryLoaded) {
          setState(() {
            perviousAttendance = state.history;
            visibleItems = state.history.length > 3 ? 3 : state.history.length;
          });
        }
      },
      builder: (context, state) {
        if (state is HistoryLoading) {
          return HistoryLoadingShimmer();
        } else if (state is HistoryLoadError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
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
                children: [
                  const AppSpace(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppText(LangKeys.lastAttendance, isTitle: true),
                  ),
                  PerviousAttendanceListview(
                    listKey: _listKey,
                    visibleItems: visibleItems,
                    perviousAttendance: perviousAttendance,
                  ),
                  if (perviousAttendance.length > 3)
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
      },
    );
  }
}
