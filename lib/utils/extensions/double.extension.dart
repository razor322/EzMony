import 'package:flutter/material.dart';

extension DoubleExtensions on double {
  Widget toHorizontalSpace() => SizedBox(width: this);
  Widget toVerticalSpace() => SizedBox(height: this);
}
