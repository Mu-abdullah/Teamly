import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import '../../../data/repo/upload_emp_info_to_supabase.dart';

part 'upload_new_emp_data_state.dart';

class UploadNewEmpDataCubit extends Cubit<UploadNewEmpDataState> {
  UploadEmpInfoToSupabase uploadEmpInfoToSupabase;
  UploadNewEmpDataCubit(this.uploadEmpInfoToSupabase)
    : super(UploadNewEmpDataInitial());

  static UploadNewEmpDataCubit get(context) => BlocProvider.of(context);

  Future<void> uploadEmpData({required EmpModel emp}) async {
    emit(EmpUploading());
    debugPrint('Uploading employee data: ${emp.toJson()}');
    try {
      final result = await uploadEmpInfoToSupabase.uploadEmpInfoToSupabase(emp);
      result.fold(
        (l) {
          debugPrint('Upload error: ${l.message}');
          if (!isClosed) {
            emit(EmpUploadError(l.message));
          }
        },
        (r) {
          debugPrint('Upload success: $r');
          if (!isClosed) {
            emit(EmpUploaded(emp: r));
          }
        },
      );
    } catch (e) {
      debugPrint('Unexpected error: $e');
      if (!isClosed) {
        emit(EmpUploadError(LangKeys.error));
      }
    }
  }
}
