import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/review_vacation_model.dart';
import '../../../data/repo/review_vacation_repo.dart';

part 'review_vacation_state.dart';

class ReviewVacationCubit extends Cubit<ReviewVacationState> {
  ReviewVacationRepo repo;
  ReviewVacationCubit(this.repo) : super(ReviewVacationInitial());

  Future<void> reviewVacationRequest(String compID) async {
    emit(ReviewVacationLoading());
    var result = await repo.reviewVacationRequest(compID);
    result.fold(
      (l) => emit(ReviewVacationError(l.message)),
      (r) => emit(ReviewVacationLoaded(r)),
    );
  }
}
