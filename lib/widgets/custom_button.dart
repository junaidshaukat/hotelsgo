import 'package:flutter/material.dart';
import '/export.dart';

class Steppers extends StatelessWidget {
  const Steppers({super.key, this.icon, this.onPressed});

  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.width),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.dodgerBlue,
          shape: CircleBorder(
            side: BorderSide(color: AppColors.dodgerBlue),
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
