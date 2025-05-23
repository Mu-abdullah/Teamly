import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../cubits/paper_viewer_cubit/paper_viewer_cubit.dart';

class PdfViewerWidget extends StatelessWidget {
  const PdfViewerWidget({super.key, required this.url, required this.cubit});

  final String url;
  final PaperViewerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              if (HardwareKeyboard.instance.logicalKeysPressed.contains(
                    LogicalKeyboardKey.controlLeft,
                  ) ||
                  HardwareKeyboard.instance.logicalKeysPressed.contains(
                    LogicalKeyboardKey.controlRight,
                  )) {
                final scrollDelta = pointerSignal.scrollDelta.dy;

                final zoomChange = scrollDelta > 0 ? -0.1 : 0.1;
                final newZoom = (cubit.zoomLevel + zoomChange).clamp(0.5, 5.0);

                cubit.updateZoomLevel(newZoom);
              }
            }
          },
          child: SfPdfViewer.network(
            pageLayoutMode: PdfPageLayoutMode.continuous,
            scrollDirection: PdfScrollDirection.horizontal,
            url,
            key: cubit.pdfViewerKey,
            enableDoubleTapZooming: true,
            controller: cubit.pdfViewerController,
            maxZoomLevel: 5,
            initialZoomLevel: 1,
            onZoomLevelChanged: (v) {
              cubit.updateZoomLevel(cubit.pdfViewerController.zoomLevel);
            },

            initialScrollOffset: Offset.zero,
          ),
        ),
      ),
    );
  }
}
