import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/werehouse_model.dart';
import '../cubits/warehouse_cubit/warehouse_cubit.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key, required this.cubit});
  final WarehouseCubit cubit;
  @override
  Widget build(BuildContext context) {
    final categories = _extractCategories(cubit.items);

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = cubit.selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterChip(
              label: AppText(
                category,
                translate: false,
                color: isSelected ? AppColors.white : AppColors.green,
              ),
              selected: isSelected,
              selectedColor: AppColors.green,
              checkmarkColor: isSelected ? AppColors.white : AppColors.green,
              elevation: 8,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              onSelected: (selected) {
                cubit.filterByCategory(category);
              },
            ),
          );
        },
      ),
    );
  }

  List<String> _extractCategories(List<WarehouseModel> products) {
    return products.map((e) => e.category!).toSet().toList();
  }
}
