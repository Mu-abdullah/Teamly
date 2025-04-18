import 'package:flutter/material.dart';

import 'pervious_attendance_item.dart';

class PerviousAttendanceListview extends StatefulWidget {
  const PerviousAttendanceListview({
    super.key,
    required GlobalKey<AnimatedListState> listKey,
    required this.visibleItems,
    required this.perviousAttendance,
  }) : _listKey = listKey;

  final GlobalKey<AnimatedListState> _listKey;
  final int visibleItems;
  final List<int> perviousAttendance;

  @override
  State<PerviousAttendanceListview> createState() =>
      _PerviousAttendanceListviewState();
}

class _PerviousAttendanceListviewState
    extends State<PerviousAttendanceListview> {
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: widget._listKey,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      initialItemCount: widget.visibleItems, // Initial visible items
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          axis: Axis.vertical,
          child: PerviousAttendanceItem(
            index: widget.perviousAttendance[index],
          ),
        );
      },
    );
  }
}
