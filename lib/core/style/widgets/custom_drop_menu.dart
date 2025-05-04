import 'package:flutter/material.dart';

import 'app_text.dart';

class GenericDropdown<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) getDisplayText;
  final T? selectedValue;
  final void Function(T?) onChanged;
  final String hint;

  const GenericDropdown({
    super.key,
    required this.items,
    required this.getDisplayText,
    required this.onChanged,
    required this.hint,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      items:
          items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: AppText(getDisplayText(item), translate: false),
              ),
            );
          }).toList(),
      hint: Padding(padding: EdgeInsets.only(left: 8), child: AppText(hint)),
      borderRadius: BorderRadius.circular(12),
      icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 28),
      iconSize: 32,
      dropdownColor: Colors.white,
      elevation: 2,
      menuMaxHeight: 300,
      alignment: AlignmentDirectional.center,
      onChanged: onChanged,
      selectedItemBuilder: (BuildContext context) {
        return items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: AppText(getDisplayText(item), translate: false),
          );
        }).toList();
      },
    );
  }
}
