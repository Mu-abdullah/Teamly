import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/functions/generate_id.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/status/job_status.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../../../../../core/style/widgets/circle_progress.dart';
import '../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../../auth/data/models/emp_model.dart';
import '../cubits/images_cubit/get_image_cubit.dart';
import '../cubits/new_emp_cubit/new_emp_cubit.dart';
import '../widgets/new_emp_form.dart';
import '../widgets/new_emp_gender.dart';
import '../widgets/new_emp_papers_images/new_emp_papers_images.dart';
import '../widgets/new_emp_position.dart';

class NewEmpScreenBody extends StatelessWidget {
  const NewEmpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var comp = context.read<AppUserCubit>().compId;
    return SingleChildScrollView(
      child: BlocConsumer<NewEmpCubit, NewEmpState>(
        listener: (context, state) {
          if (state is NewEmpLoading) {
            showProgressIndicator(context);
          } else if (state is NewEmpSubmitted) {
            if (context.mounted) {
              context.pop();
              CustomSnackbar.showTopSnackBar(
                context,
                message: LangKeys.addedSuccess,
              );
              context.pushNamedAndRemoveUntil(RoutesNames.homeScreen);
            }
          }
        },
        builder: (context, state) {
          var cubit = NewEmpCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              spacing: 15,
              children: [
                NewEmpForm(cubit: cubit),
                NewEmpPosition(cubit: cubit),
                NewEmpGender(cubit: cubit),
                const Divider(),
                NewEmpPapersImages(),
                const Divider(),
                AppButton(
                  onTap: () async {
                    var images =
                        context
                            .read<GetImageCubit>()
                            .images
                            .whereType<File>()
                            .toList();
                    if (cubit.formKey.currentState!.validate()) {
                      if (images.isEmpty) {
                      } else {
                        var pdfUrl = await cubit.convertAndUpload(
                          companyID: comp,
                          images: images,
                        );

                        if (cubit.image == null) {
                          if (context.mounted) {
                            CustomSnackbar.showTopSnackBar(
                              context,
                              message: LangKeys.image,
                              backgroundColor: AppColors.red,
                            );
                          }
                        } else {
                          var imageUrl = await cubit.uploadImage(
                            companyID: comp,
                            image: cubit.image!,
                          );
                          if (context.mounted) {
                            if (cubit.positionId == null) {
                              CustomSnackbar.showTopSnackBar(
                                context,
                                message: LangKeys.position,
                                backgroundColor: AppColors.red,
                              );
                            } else {
                              if (cubit.gender == null) {
                                CustomSnackbar.showTopSnackBar(
                                  context,
                                  message: LangKeys.gender,
                                  backgroundColor: AppColors.red,
                                );
                              } else {
                                var emp = EmpModel(
                                  name: cubit.name.text.trim(),
                                  nid: cubit.nid.text.trim(),
                                  phone: cubit.phone.text.trim(),
                                  salary: cubit.salary.text.trim(),
                                  startIn: cubit.startIn.text.trim(),
                                  id: GenerateId.generateDocumentId(
                                    context: context,
                                    tableName: BackendPoint.emp,

                                    companyName: comp,
                                  ),
                                  jobStatus: JobStatus.onWork,
                                  gender: cubit.gender,
                                  address: cubit.address.text.trim(),
                                  comId: comp,
                                  createdAt: DateTime.now().toString(),
                                  position: cubit.positionId,
                                  image: imageUrl,
                                  papers: pdfUrl,
                                );
                                await cubit.uploadEmpData(emp: emp);
                              }
                            }
                          }
                        }
                      }
                    }
                  },
                  text: LangKeys.save,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
