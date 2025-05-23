import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

part 'paper_viewer_state.dart';

class PaperViewerCubit extends Cubit<PaperViewerState> {
  PaperViewerCubit() : super(PaperViewerInitial()) {
    initializePdfViewer();
  }

  static PaperViewerCubit get(context) => BlocProvider.of(context);

  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  final PdfViewerController pdfViewerController = PdfViewerController();
  
  double _zoomLevel = 1.0;
  double get zoomLevel => _zoomLevel;

  void updateZoomLevel(double newZoom) {
    _zoomLevel = newZoom.clamp(0.5, 3.0);
    pdfViewerController.zoomLevel = _zoomLevel;
    emit(PaperViewerZoomUpdated(_zoomLevel));
  }

  void goToPage(int pageNumber) {
    pdfViewerController.jumpToPage(pageNumber);
  }

  void initializePdfViewer() {
    pdfViewerController.addListener(() {
      emit(PaperViewerPageChanged(pdfViewerController.pageNumber));
    });
  }

  void nextPage() {
    pdfViewerController.nextPage();
    emit(PaperViewerPageChanged(pdfViewerController.pageNumber));
  }

  void previousPage() {
    pdfViewerController.previousPage();
    emit(PaperViewerPageChanged(pdfViewerController.pageNumber));
  }

  @override
  Future<void> close() {
    pdfViewerController.dispose();
    return super.close();
  }
}
