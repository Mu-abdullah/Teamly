import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/entities/custody_entity.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class CustodyItem extends StatefulWidget {
  final CustodyEntity custody;
  const CustodyItem({super.key, required this.custody});

  @override
  State<CustodyItem> createState() => _CustodyItemState();
}

class _CustodyItemState extends State<CustodyItem>
    with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(milliseconds: 300);

  late final AnimationController _controller;
  late final Animation<double> _heightAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    _heightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      if (_controller.isCompleted) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder:
            (context, child) => Container(
              decoration: _containerDecoration(),
              child: Column(
                children: [
                  _buildHeader(),
                  ClipRect(
                    child: Align(
                      heightFactor: _heightAnimation.value,
                      child: _buildContent(),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.white, AppColors.blueAccent.withValues(alpha: 0.1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: AppBorderRadius.mediumRadius,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: 0.1),
          blurRadius: 12,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _toggleExpansion,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(
                HugeIcons.strokeRoundedBriefcaseDollar,
                color: AppColors.black,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppText(
                  widget.custody.name ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  translate: false,
                ),
              ),
              RotationTransition(
                turns: _rotationAnimation,
                child: const Icon(
                  Icons.expand_more_rounded,
                  color: AppColors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          _buildDetailRow(
            icon: HugeIcons.strokeRoundedCalendar01,
            label: LangKeys.custodyDate,
            value: widget.custody.createdAt.toString(),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            icon: HugeIcons.strokeRoundedPoundSquare,
            label: LangKeys.custodyAmount,
            value: widget.custody.amount.toString(),
            valueColor: AppColors.green,
          ),
          const SizedBox(height: 16),
          Row(
            spacing: 10,
            children: [
              Expanded(child: _buildStatusChip()),
              Expanded(child: _buildShowMoreButton()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
    int maxLines = 1,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.darkGrey),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(label, fontSize: 12, color: AppColors.darkGrey),
              const SizedBox(height: 4),
              AppText(
                value,
                color: valueColor ?? AppColors.black,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                translate: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip() {
    final status = widget.custody.status!;
    final color = _getStatusColor(status);
    final icon =
        status == CustodyStatus.settlement
            ? HugeIcons.strokeRoundedCheckmarkCircle03
            : HugeIcons.strokeRoundedCancelCircle;

    return _buildChip(icon: icon, text: _getStatusText(status), color: color);
  }

  Widget _buildShowMoreButton() {
    final status = widget.custody.status!;
    final color = _getStatusColor(status);

    return InkWell(
      borderRadius: AppBorderRadius.mediumRadius,
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: color.withValues(alpha: 0.2), width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              LangKeys.showMore,
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            Icon(HugeIcons.strokeRoundedFolderDetails, color: color),
          ],
        ),
      ),
    );
  }

  Widget _buildChip({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          AppText(
            text,
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  String _getStatusText(String status) {
    return switch (status) {
      CustodyStatus.settlement => LangKeys.settled,
      CustodyStatus.notSettled => LangKeys.notSettled,
      _ => LangKeys.error,
    };
  }

  Color _getStatusColor(String status) {
    return switch (status) {
      CustodyStatus.settlement => AppColors.green,
      CustodyStatus.notSettled => AppColors.orange,
      _ => AppColors.red,
    };
  }
}
