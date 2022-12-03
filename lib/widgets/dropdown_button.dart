import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu(
      {super.key,
      required this.items,
      required this.onChangedCallBack,
      required this.currentItem});
  final List<String> items;
  final void Function(String?) onChangedCallBack;
  final String? currentItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
          value: currentItem,
          items: items
              .map((String item) =>
                  DropdownMenuItem(child: Text(item), value: item))
              .toList(),
          isExpanded: true,
          onChanged: onChangedCallBack),
    );
  }
}
