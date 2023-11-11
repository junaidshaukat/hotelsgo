import 'package:flutter/material.dart';
import '/export.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Color? color;
  final IconData? icon;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final bool readOnly;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final double? fontSize;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onPressed;

  const CustomTextFormField({
    super.key,
    this.color,
    this.hintText,
    this.onTap,
    this.onPressed,
    this.onChanged,
    this.icon,
    this.label,
    this.prefix,
    this.border,
    this.enabledBorder,
    this.readOnly = false,
    this.controller,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      textAlign: textAlign,
      readOnly: readOnly,
      controller: controller,
      style: TextStyle(
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        label: label,
        prefix: prefix,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: TextStyle(
          color: color ?? AppColors.dodgerBlue,
        ),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.width)),
              borderSide: BorderSide(color: color ?? AppColors.dodgerBlue),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.width)),
              borderSide: BorderSide(color: color ?? AppColors.dodgerBlue),
            ),
      ),
    );
  }
}
