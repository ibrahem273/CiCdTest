import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class FormatHelper {
//  ?  NUMBERS FORMATS
  static String convertNumberToWriting({required double number}) {
    debugPrint("Tafqeet.convert('123'); ${number..toInt().toString()}");
    return Tafqeet.convert(number.toInt().toString());
  }

  static String formatNumber(double number,NumberFormat? format) {
    final formatter =format??
        NumberFormat('###,###.######'); // Adjust the format string as needed

    // Remove trailing zeros after the decimal point
    final formattedNumber =
        formatter.format(number).replaceAll(RegExp(r'(\.\d*?)0+$'), r'$1');

    // Add apostrophes for every three zeros
    return formattedNumber.replaceAll(RegExp(r'(?<=\d)(?=(?:\d{3})+$)'), ',');
  }

  static String formatStringNumber(String number) {
    final formatter =
        NumberFormat('###,###.#####'); // Adjust the format string as needed

    // Remove trailing zeros after the decimal point, but not leading zeros
    // final formattedNumber =
    //     formatter.format(number).replaceAll(RegExp(r'(?<=\d)\.0+$'), '');

    // Add apostrophes for every three digits, excluding the first group
    // return number.toString().replaceAll(RegExp(r'(?<=\d)(?=(?:\d{3})+$)'), ',');

    final formattedNumber =
        number.replaceAll(RegExp(r'(?<=\d)(?=(?:\d{3})+$)'), ',');
    return formattedNumber;

    // // Remove trailing zeros after the decimal point
    // final formattedNumber = formatter.format(number).replaceAll(RegExp(r'(\.\d*?)0+$'), r'$1');

    // // Add apostrophes for every three zeros
    // return formattedNumber.replaceAll(RegExp(r'(?<=\d)(?=(?:\d{3})+$)'), ',');
  }
}
