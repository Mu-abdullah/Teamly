import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/services/status/job_status.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/circle_progress.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../../../auth/data/models/emp_model.dart';
import '../cubits/images_cubit/get_image_cubit.dart';
import '../cubits/new_emp_form_cubit/new_emp_form_cubit.dart';
import '../cubits/upload_new_emp_data_cubit/upload_new_emp_data_cubit.dart';

class SubmitedEmp extends StatelessWidget {
  const SubmitedEmp({
    super.key,
    required this.cubitForm,
    required this.companyId,
  });

  final NewEmpFormCubit cubitForm;
  final String companyId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadNewEmpDataCubit, UploadNewEmpDataState>(
      listener: (context, state) {
        if (state is EmpUploading) {
          showProgressIndicator(context);
        } else if (state is EmpUploaded) {
          if (context.mounted) {
            context.pop();
            CustomSnackbar.showTopSnackBar(
              context,
              message: LangKeys.addedSuccess,
            );
            context.pushNamedAndRemoveUntil(RoutesNames.homeScreen);
          }
        } else if (state is EmpUploadError) {
          if (context.mounted) {
            context.pop();
            CustomSnackbar.showTopSnackBar(
              context,
              message: state.message,
              translate: false,
              backgroundColor: AppColors.red,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = UploadNewEmpDataCubit.get(context);
        return AppButton(
          onTap: () => _handleSubmit(context, cubit: cubit),
          text: LangKeys.save,
        );
      },
    );
  }

  Future<void> _handleSubmit(
    BuildContext context, {
    required UploadNewEmpDataCubit cubit,
  }) async {
    if (!_validateForm(context)) return;

    final images =
        context.read<GetImageCubit>().images.whereType<File>().toList();
    if (images.isEmpty) {
      _showErrorSnackBar(context, LangKeys.noImage);
      return;
    }

    try {
      final pdfUrl = await cubitForm.convertAndUpload(
        companyID: companyId,
        images: images,
      );

      if (cubitForm.image == null) {
        _showErrorSnackBar(context, LangKeys.image);
        return;
      }

      final imageUrl = await cubitForm.uploadImage(
        companyID: companyId,
        image: cubitForm.image!,
      );

      if (!_validateRequiredFields(context)) return;

      await _submitEmployeeData(context, imageUrl, pdfUrl, cubit);
    } catch (e) {
      _showErrorSnackBar(context, LangKeys.error);
    }
  }

  bool _validateForm(BuildContext context) {
    return cubitForm.formKey.currentState?.validate() ?? false;
  }

  bool _validateRequiredFields(BuildContext context) {
    if (cubitForm.positionId == null) {
      _showErrorSnackBar(context, LangKeys.position);
      return false;
    }
    if (cubitForm.gender == null) {
      _showErrorSnackBar(context, LangKeys.gender);
      return false;
    }
    return true;
  }

  Future<void> _submitEmployeeData(
    BuildContext context,
    String imageUrl,
    String pdfUrl,
    UploadNewEmpDataCubit cubit,
  ) async {
    final emp = EmpModel(
      id:
          GenerateId.generateDocumentId(
            context: context,
            tableName: BackendPoint.emp,
            companyName: companyId,
          ).toString(),
      name: cubitForm.name.text.trim().toString(),
      nid: cubitForm.nid.text.trim().toString(),
      phone: cubitForm.phone.text.trim().toString(),
      salary: cubitForm.salary.text.trim().toString(),
      startIn: cubitForm.startIn.text.trim().toString(),
      address: cubitForm.address.text.trim().toString(),
      comId: companyId.toString(),
      createdAt: DateTime.now().toString(),
      position: cubitForm.positionId.toString(),
      gender: cubitForm.gender.toString(),
      image: imageUrl.toString(),
      papers: pdfUrl.toString(),
      jobStatus: JobStatus.onWork.toString(),
    );

    await cubit.uploadEmpData(emp: emp);
  }

  void _showErrorSnackBar(
    BuildContext context,
    String message, {
    bool translate = true,
  }) {
    if (context.mounted) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: message,
        backgroundColor: AppColors.red,
        translate: translate,
      );
    }
  }
}
