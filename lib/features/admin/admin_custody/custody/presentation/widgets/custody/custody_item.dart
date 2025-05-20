import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/routes/routes_name.dart';
import '../../../../../../../core/services/status/custody_status.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/custody_model.dart';
import '../../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../../cubits/settled_custody_cubit/settled_custody_cubit.dart';

class CustodyItem extends StatefulWidget {
  final CustodyModel custody;
  const CustodyItem({super.key, required this.custody, this.showMore = true});
  final bool showMore;
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
      color: AppColors.white,
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
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: _toggleExpansion,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Row(
          spacing: 12,
          children: [
            const Icon(
              HugeIcons.strokeRoundedBriefcaseDollar,
              color: AppColors.black,
              size: 24,
            ),

            Expanded(
              child: AppText(widget.custody.name ?? '', translate: false),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustodyStatus.getStatusColor(widget.custody.status!),
                borderRadius: AppBorderRadius.mediumRadius,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(
                  widget.custody.status!,
                  fontSize: context.labelSmall!.fontSize,
                  color: AppColors.white,
                ),
              ),
            ),
            RotationTransition(
              turns: _rotationAnimation,
              child: const Icon(
                Icons.expand_more_rounded,
                color: AppColors.black,
              ),
            ),
          ],
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
            value: TimeRefactor(widget.custody.createdAt!).toDateString(),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            icon: HugeIcons.strokeRoundedPoundSquare,
            label: LangKeys.custodyAmount,
            value: widget.custody.totalAmount!,
            valueColor: AppColors.green,
          ),
          const SizedBox(height: 16),
          Row(
            spacing: widget.showMore ? 10 : 0,
            children: [
              widget.showMore
                  ? Expanded(child: _buildActionButton())
                  : const SizedBox.shrink(),
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

  Widget _buildActionButton() {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: AppButton(
            onTap: () {
              context.pushNamed(
                RoutesNames.custodyTransactions,
                arguments: {'model': widget.custody},
              );
            },
            text: LangKeys.showMore,
            fontSize: 12,
            circleSize: 40,
          ),
        ),
        if (widget.custody.status != CustodyStatus.settled)
          Expanded(
            child: AppButton(
              onTap: () {
                context
                    .read<SettledCustodyCubit>()
                    .updateCustodyStatus(
                      id: widget.custody.id!,
                      status: CustodyStatus.settled,
                    )
                    .then((onValue) {
                      if (mounted) {
                        context.read<GetCustodyCubit>().fetchCustody(
                          context.read<AppUserCubit>().compId,
                        );
                      }
                    });
              },
              text: LangKeys.settlement,
              fontSize: 12,
              circleSize: 40,
              backGroungColor: CustodyStatus.getStatusColor(
                widget.custody.status!,
              ),
            ),
          ),
      ],
    );
  }
}
