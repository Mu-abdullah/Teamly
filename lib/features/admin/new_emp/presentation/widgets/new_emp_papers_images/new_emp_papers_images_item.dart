import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../cubits/images_cubit/get_image_cubit.dart';

class NewEmpPapersImagesItem extends StatelessWidget {
  const NewEmpPapersImagesItem({
    super.key,
    required this.images,
    required this.index,
  });

  final List<File?> images;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              images[index]!,
              fit: BoxFit.cover,
              width: 150,
              height: 200,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () => context.read<GetImageCubit>().removeImage(index),
              child: CircleAvatar(
                backgroundColor: AppColors.white.withValues(alpha: 0.9),
                radius: 15,
                child: Icon(
                  HugeIcons.strokeRoundedImageDelete01,
                  size: 18,
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
