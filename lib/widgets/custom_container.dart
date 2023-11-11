import 'package:flutter/material.dart';
import '/export.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? color;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final String? image;
  final Alignment? alignment;
  final Gradient? gradient;

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.child,
    this.color,
    this.borderRadius,
    this.image,
    this.alignment,
    this.gradient,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? artboardWidth.width,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
        image: image != null
            ? DecorationImage(
                image: AssetImage(image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
