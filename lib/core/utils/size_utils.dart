import 'dart:ui';

import 'package:flutter/material.dart';

// This functions are responsible to make UI responsive across all the mobile devices.
MediaQueryData mediaQueryData = MediaQueryData.fromView(
  PlatformDispatcher.instance.views.first,
);

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num artboardWidth = 375;
const num artboardHeight = 812;
const num artboardStatusbar = 0;

///This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  ///This method is used to get device viewport width.
  get _width {
    return mediaQueryData.size.width;
  }

  ///This method is used to get device viewport height.
  get _height {
    num statusBar = mediaQueryData.viewPadding.top;
    num bottomBar = mediaQueryData.viewPadding.bottom;
    num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
    return screenHeight;
  }

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double get width => ((this * _width) / artboardWidth);

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double get height => (this * _height) / (artboardHeight - artboardStatusbar);

  ///This method is used to set smallest px in image height and width
  double get adaptSize {
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  ///This method is used to set text font size according to Viewport
  double get fontSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
