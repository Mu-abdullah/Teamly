import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/paper_viewer_cubit/paper_viewer_cubit.dart';

class PageNavigationControls extends StatelessWidget {
  const PageNavigationControls({super.key, required this.cubit});

  final PaperViewerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            onTap: cubit.nextPage,
            isCircle: true,
            backGroungColor: AppColors.blueBlack,
            icon: HugeIcons.strokeRoundedNext,
          ),
          AppText(
            "${cubit.pdfViewerController.pageNumber} / ${cubit.pdfViewerController.pageCount}",
            fontSize: 20,
            color: AppColors.blueBlack,
            translate: false,
          ),
          AppButton(
            onTap: cubit.previousPage,
            isCircle: true,
            backGroungColor: AppColors.blueBlack,
            icon: HugeIcons.strokeRoundedPrevious,
          ),
        ],
      ),
    );
  }
}
