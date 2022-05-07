import 'package:flutter/material.dart';

/// Returns height & width percentage based on [this] value.
extension PercentSized on num {
  static Size size = WidgetsBinding.instance!.window.physicalSize;

  double get hp => (size.height * (this / 100));

  double get wp => (size.width * (this / 100));
}

/// Returns responsive sp value for text sizes.
extension ResponsiveText on num {
  static Size size = WidgetsBinding.instance!.window.physicalSize;

  double get sp => size.width / 100 * (this / 3);
}

/// Returns responsive sp value for text sizes.
extension Capitalization on String {
  String get toTitleCase => replaceFirst(this[0], this[0].toUpperCase());
}
