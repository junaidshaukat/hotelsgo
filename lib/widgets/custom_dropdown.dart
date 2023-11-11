import 'package:flutter/material.dart';
import '/export.dart';

class CustomDropdownButton extends StatelessWidget {
  final bool isExpanded;
  final String hint;
  final String? value;
  final double? fontSize;
  final Color? color;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;

  const CustomDropdownButton({
    super.key,
    this.hint = 'hint',
    this.fontSize,
    this.color,
    this.items,
    this.onChanged,
    this.isExpanded = true,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      isExpanded: isExpanded,
      items: items,
      underline: const SizedBox(),
      onChanged: onChanged,
      padding: EdgeInsets.symmetric(horizontal: 4.width),
      hint: Text(hint),
      disabledHint: Text(hint),
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? AppColors.dodgerBlue,
      ),
    );
  }
}
