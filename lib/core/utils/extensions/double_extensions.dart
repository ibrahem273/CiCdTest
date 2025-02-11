import 'package:flutter/material.dart';

extension DoubleExtensions on double {
  double calculateRatio({required otherValue}) =>
      (this + otherValue) == 0 ? 0 : (this / (otherValue + this)) * 100;

  String returnJustTwoDigitAfterDecimalPointAndRemoveItIfEqualZer() {
    debugPrint("aasd as ${toStringAsFixed(0)} ${toString()}");

    debugPrint("aasd as ${(this - toInt() == 0)}");

    if (this - toInt() == 0) {
      debugPrint("aasd as ${toStringAsFixed(0)} ${toString()}");
      return toStringAsFixed(0);
    }

    return toStringAsFixed(2);
  }
}
