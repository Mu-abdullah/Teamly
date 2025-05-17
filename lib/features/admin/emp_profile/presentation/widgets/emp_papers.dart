import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';

class PaperViewer extends StatefulWidget {
  const PaperViewer({super.key, required this.url});
  final String? url;
  @override
  State<PaperViewer> createState() => _PaperViewerState();
}

class _PaperViewerState extends State<PaperViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.papers),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: context.height(),
          color: AppColors.white,
          child:
              widget.url == null
                  ? const Center(child: AppText(LangKeys.noPapers))
                  : SfPdfViewer.network(
                    scrollDirection: PdfScrollDirection.horizontal,
                    widget.url!,
                    key: _pdfViewerKey,
                    enableDoubleTapZooming: true,
                  ),
        ),
      ),
    );
  }
}
