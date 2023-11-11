import 'package:flutter/material.dart';
import 'theme_helper.dart';

class AppDecoration {
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.white,
      );
}

class BorderRadiusStyle {}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
