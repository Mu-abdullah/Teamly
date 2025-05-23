part of 'paper_viewer_cubit.dart';

sealed class PaperViewerState extends Equatable {
  const PaperViewerState();

  @override
  List<Object> get props => [];
}

final class PaperViewerInitial extends PaperViewerState {}

final class PaperViewerPageChanged extends PaperViewerState {
  final int pageNumber;
  const PaperViewerPageChanged(this.pageNumber);
  @override
  List<Object> get props => [pageNumber];
}

class PaperViewerZoomUpdated extends PaperViewerState {
  final double zoomLevel;
  const PaperViewerZoomUpdated(this.zoomLevel);
  @override
  List<Object> get props => [zoomLevel];
}
