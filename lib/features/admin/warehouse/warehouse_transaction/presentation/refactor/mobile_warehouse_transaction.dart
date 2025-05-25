import 'package:flutter/material.dart';

import '../../../../../../core/style/widgets/app_text.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';

class MobileWarehouseTransaction extends StatelessWidget {
  const MobileWarehouseTransaction({super.key, required this.cubit});
  final WarehouseTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        itemCount: cubit.results.length,
        itemBuilder: (_, index) {
          var item = cubit.results[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: AppText(translate: false, item.warehouse ?? 'No Name'),
              subtitle: AppText(translate: false, 'Quantity: ${item.quantity}'),
              trailing: AppText(translate: false, 'Status: ${item.unitType}'),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
