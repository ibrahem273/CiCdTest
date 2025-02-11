import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CommonHelper {
  //todo not completed
  static void handleSizeChange(Size size) {
    final orientations = <DeviceOrientation>[];

    orientations.addAll([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    bool isSmall = size.shortestSide < 600 && size != Size.zero;
    if (!isSmall) {}
  }

  static bool isTheTwoDatesInTheSameDay(
      {required DateTime date1, required DateTime date2}) {
    return (DateFormat.yMd().parse(date1.toString()) ==
        DateFormat.yMd().parse(date2.toString()));
  }

  static changeCoinHelper(
      {required String targetCoin,
      required String currentCoint,
      required double exChangeRate,
      required double count,
      required double price}) {
    debugPrint(" targetCoin2314 $targetCoin");
    debugPrint("currentCoint  $currentCoint");

    debugPrint(" exChangeRate $exChangeRate");

    debugPrint(" count $count");
    debugPrint(" price $price");

    double total = (targetCoin == currentCoint)
        ? (price * count)
        : ((currentCoint == 'dollar')
            ? () {
                debugPrint("yyyyyyy");
                return (exChangeRate * price) * count;
              }()
            : (price / exChangeRate) * count);

    return total;
  }

  static String generateUniqueBarcodeHelper({double? fontHeight}) {
    final randomNumber = Random().nextInt(90000000);
    return randomNumber.toString();
  }
}
