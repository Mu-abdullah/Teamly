import 'dart:io';
import 'package:flutter/material.dart';
import 'new_emp_papers_images_item.dart';

class NewEmpPapersImagesListview extends StatelessWidget {
  const NewEmpPapersImagesListview({super.key, required this.images});

  final List<File?> images;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return NewEmpPapersImagesItem(images: images, index: index);
      },
    );
  }
}
