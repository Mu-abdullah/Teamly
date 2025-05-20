import 'package:flutter/material.dart';

import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../warehouse/data/model/werehouse_model.dart';

class WarehouseTransaction extends StatelessWidget {
  const WarehouseTransaction({super.key, required this.model});
  final WarehouseModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: model.name!, translate: false));
  }
}
