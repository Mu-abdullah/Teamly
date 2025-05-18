import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../language/lang_keys.dart';
import '../style/widgets/app_text.dart';

void selectData({
  required BuildContext context,
  required TextEditingController controller,
  required String content,
}) {
  var date = BottomPicker.date(
    pickerTitle: AppText(content),
    layoutOrientation: TextDirection.rtl,
    dateOrder: DatePickerDateOrder.dmy,
    initialDateTime: DateTime.now(),
    maxDateTime: DateTime(2030),
    minDateTime: DateTime(1980),
    pickerTextStyle: customTextStyle(context),
    buttonContent: const AppText(
      LangKeys.chooseDate,
      color: Colors.white,
      textAlign: TextAlign.center,
    ),
    buttonStyle: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    onChange: (index) {},
    onSubmit: (index) async {
      // var date = convertDateToArabic(index.toString());
      controller.text = index.toString();
    },
    bottomPickerTheme: BottomPickerTheme.blue,
  );

  date.show(context);
}

String convertDateToArabic(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = intl.DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
