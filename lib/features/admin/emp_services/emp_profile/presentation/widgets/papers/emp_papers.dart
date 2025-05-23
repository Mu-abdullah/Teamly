import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../cubits/paper_viewer_cubit/paper_viewer_cubit.dart';
import 'page_navigation_controls.dart';
import 'pdfviewer_widget.dart';
import 'zoom_slider.dart';

class PaperViewer extends StatelessWidget {
  const PaperViewer({super.key, required this.url});
  final String? url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaperViewerCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.papers),
        body: BlocBuilder<PaperViewerCubit, PaperViewerState>(
          builder: (context, state) {
            final cubit = PaperViewerCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: AppColors.white,
                child:
                    url == null
                        ? const Center(child: AppText(LangKeys.noPapers))
                        : Column(
                          spacing: 20,
                          children: [
                            Row(
                              spacing: 20,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: PageNavigationControls(cubit: cubit),
                                ),

                                Expanded(
                                  flex: 3,
                                  child: ZoomSlider(
                                    zoomLevel: cubit.zoomLevel,
                                    onZoomChanged: cubit.updateZoomLevel,
                                    minZoom: 1.0,
                                    maxZoom: 3.0,
                                    divisions: 5,
                                  ),
                                ),
                              ],
                            ),
                            PdfViewerWidget(url: url!, cubit: cubit),
                          ],
                        ),
              ),
            );
          },
        ),
      ),
    );
  }
}
