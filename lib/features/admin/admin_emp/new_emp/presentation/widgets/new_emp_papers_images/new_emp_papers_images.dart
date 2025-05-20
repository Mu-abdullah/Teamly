import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/images_cubit/get_image_cubit.dart';
import 'new_emp_papers_images_listview.dart';

class NewEmpPapersImages extends StatelessWidget {
  const NewEmpPapersImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        BlocBuilder<GetImageCubit, GetImageState>(
          builder: (context, state) {
            if (state is ImageGetLoading) {
              return const CircularProgressIndicator();
            } else if (state is ImageGetSuccess) {
              final images = state.images;
              return SizedBox(
                height: 210,
                child:
                    images.isNotEmpty
                        ? NewEmpPapersImagesListview(images: images)
                        : Center(child: AppText(LangKeys.noImage)),
              );
            } else if (state is ImageGetFailure) {
              return AppText('Error: ${state.error}', translate: false);
            } else {
              return Container();
            }
          },
        ),
        AppButton(
          onTap: () {
            context.read<GetImageCubit>().pickImages();
          },
          text: LangKeys.getEmpPaper,
          isBorderd: true,
          borderColor: AppColors.blueAccent,
        ),
      ],
    );
  }
}
