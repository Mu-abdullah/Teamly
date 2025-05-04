part of 'review_vacation_cubit.dart';

sealed class ReviewVacationState extends Equatable {
  const ReviewVacationState();

  @override
  List<Object> get props => [];
}

final class ReviewVacationInitial extends ReviewVacationState {}

final class ReviewVacationLoaded extends ReviewVacationState {
  final List<ReviewVacationModel> reviewVacationList;
  const ReviewVacationLoaded(this.reviewVacationList);
}

final class ReviewVacationLoading extends ReviewVacationState {}

final class ReviewVacationError extends ReviewVacationState {
  final String message;
  const ReviewVacationError(this.message);
}
