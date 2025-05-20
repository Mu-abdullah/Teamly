import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_button.dart';
import '../../../data/model/create_custody_trans_item_model.dart';
import '../../cubits/text_field_cubit.dart';
import 'custody_item_input.dart';

class DynamicTextFormFeild extends StatefulWidget {
  const DynamicTextFormFeild({super.key});

  @override
  State<DynamicTextFormFeild> createState() => _DynamicTextFormFeildState();
}

class _DynamicTextFormFeildState extends State<DynamicTextFormFeild> {
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> countControllers;
  late List<TextEditingController> priceControllers;
  late List<FocusNode> nameFocusNodes;
  late List<FocusNode> countFocusNodes;
  late List<FocusNode> priceFocusNodes;

  @override
  void initState() {
    super.initState();
    nameControllers = [TextEditingController()];
    countControllers = [TextEditingController()];
    priceControllers = [TextEditingController()];
    nameFocusNodes = [FocusNode()];
    countFocusNodes = [FocusNode()];
    priceFocusNodes = [FocusNode()];
  }

  @override
  void dispose() {
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in countControllers) {
      controller.dispose();
    }
    for (var controller in priceControllers) {
      controller.dispose();
    }
    for (var node in nameFocusNodes) {
      node.dispose();
    }
    for (var node in countFocusNodes) {
      node.dispose();
    }
    for (var node in priceFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _requestFocus(int index, String field) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (field == 'name') {
        FocusScope.of(context).requestFocus(nameFocusNodes[index]);
      } else if (field == 'count') {
        FocusScope.of(context).requestFocus(countFocusNodes[index]);
      } else {
        FocusScope.of(context).requestFocus(priceFocusNodes[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustodyItemsCubit, List<CreateCustodyTransItemModel>>(
      builder: (context, items) {
        while (nameControllers.length < items.length) {
          nameControllers.add(TextEditingController());
          countControllers.add(TextEditingController());
          priceControllers.add(TextEditingController());
          nameFocusNodes.add(FocusNode());
          countFocusNodes.add(FocusNode());
          priceFocusNodes.add(FocusNode());
        }
        return Stack(
          children: [
            Positioned.fill(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  nameControllers[index].text = items[index].name!;
                  countControllers[index].text = items[index].count.toString();
                  priceControllers[index].text = items[index].price.toString();
                  return CustodyItemInput(
                    index: index,
                    item: items[index],
                    nameController: nameControllers[index],
                    countController: countControllers[index],
                    priceController: priceControllers[index],
                    nameFocusNode: nameFocusNodes[index],
                    countFocusNode: countFocusNodes[index],
                    priceFocusNode: priceFocusNodes[index],
                    onNameChanged: (value, index) {
                      context.read<CustodyItemsCubit>().updateItem(
                        index,
                        name: value,
                      );
                    },
                    onCountChanged: (value, index) {
                      context.read<CustodyItemsCubit>().updateItem(
                        index,
                        count: value,
                      );
                    },
                    onPriceChanged: (value, index) {
                      context.read<CustodyItemsCubit>().updateItem(
                        index,
                        price: value,
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              child: AppButton(
                onTap: () {
                  context.read<CustodyItemsCubit>().addItem(context);
                  final newIndex =
                      context.read<CustodyItemsCubit>().state.length - 1;
                  _requestFocus(newIndex, 'name');
                },
                icon: HugeIcons.strokeRoundedTaskAdd02,
                isCircle: true,
                backGroungColor: AppColors.yellow,
                iconColor: AppColors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
