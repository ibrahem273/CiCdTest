import 'package:flutter/material.dart';

class TextFieldValidation {
  static var requiredAndEnglishIntegerNumberValidationFunction = (String? p0) {
    final RegExp isAnEnglishNumber = RegExp(r'^\d+$');

    if (p0 == '' || p0 == null) {
      return 'هذا الحقل مطلوب';
    }

    debugPrint("aslnkasd $p0");

    debugPrint(
        "!isAnEnglishNumber.hasMatch(p0)${!isAnEnglishNumber.hasMatch(p0)}");
    if (!isAnEnglishNumber.hasMatch(p0)) {
      return 'هذه القيمة غير صالحة';
    }

    return null;
  };

  static var requiredValidationFunction = (String? p0) {
    debugPrint(p0.toString());
    if (p0 == '' || p0 == null) {
      return 'This value required';
    }
    return null;
  };

  static var requiredAndIntAndMoreTheElevenValidationFunctionEnglishAndArabic =
      (String? value) {
    final RegExp regex = RegExp(r'^[\u0660-\u0669]{11}');

    final RegExp isArabicNumber = RegExp(r'^[\u0660-\u0669]');

    if (!isArabicNumber.hasMatch(value ?? '')) {
      return 'القيمة غير صالحة';
    }
    if (!regex.hasMatch(value ?? '')) {
      return 'يجب ان يحتوي على اكثر من 10 خانات';
    }
    return null; // Valid phone number
  };

  static var requiredValueValidationFunction = (String? p0) {
    final RegExp isArabicNumber = RegExp(r'^[\u0660-\u0669]');

    final RegExp isAnEnglishNumber = RegExp(r'^[0-9]');

    if (p0 == '' || p0 == null) {
      return 'هذا الحقل مطلوب';
    }

    if (!isArabicNumber.hasMatch(p0) && !isAnEnglishNumber.hasMatch(p0)) {
      return 'هذه القيمة غير صالحة';
    }
    // if (isArabicNumber.hasMatch(p0)) {
    //   if (!isLengthOfArabicNumberCorret.hasMatch(p0)) {
    //     return 'يجب ان يحتوي على اكثر من 11 خانات';
    //   }
    // }
    // if (isAnEnglishNumber.hasMatch(p0)) {
    //   if (!isLengthOfEnglishNumberCorret.hasMatch(p0)) {
    //     return 'يجب ان يحتوي على اكثر من 11 خانات';
    //   }
    // }

    return null;
  };

  static var phoneNumberValidation = (String? p0) {
    final RegExp isLengthOfArabicNumberCorret =
        RegExp(r'^[\u0660-\u0669]{11}$');

    final RegExp isArabicNumber = RegExp(r'^[\u0660-\u0669]');

    final RegExp isAnEnglishNumber = RegExp(r'^[0-9]');

    final RegExp isLengthOfEnglishNumberCorret = RegExp(r'^[0-9]{11}$');

    if (p0 == '' || p0 == null) {
      return 'This value not valid';
    }
    debugPrint(
        "!isAnEnglishNumber.hasMatch(p0)${isAnEnglishNumber.hasMatch(p0)}");

    if (!isArabicNumber.hasMatch(p0) && !isAnEnglishNumber.hasMatch(p0)) {
      return 'This value not valid';
    }
    if (isArabicNumber.hasMatch(p0)) {
      if (!isLengthOfArabicNumberCorret.hasMatch(p0)) {
        return 'Must contain eleven number';
      }
    }
    if (isAnEnglishNumber.hasMatch(p0)) {
      if (!isLengthOfEnglishNumberCorret.hasMatch(p0)) {
        return 'Must contain eleven number';
      }
    }

    return null;
  };

  static var requiredAndIntValidationFunction = (String? p0) {
    debugPrint(p0.toString());
    if (p0 == '' || p0 == null) {
      return 'هذا الحقل مطلوب';
    }
    if (int.tryParse(p0) == null) {
      return 'هذه القيمة غير صالحة';
    }
    return null;
  };

  static var requiredAndDoubleValidationFunction = (String? p0) {
    debugPrint(p0.toString());
    if (p0 == '' || p0 == null) {
      return 'هذا الحقل مطلوب';
    }
    if (double.tryParse(p0) == null) {
      return 'هذه القيمة غير صالحة';
    }
    return null;
  };

  static String? passwordEightCharactersWithAllowingNullValidation(String? p0) {
    debugPrint("asd;masdp0salas$p0");
    if (p0 == null || p0 == '') {
      // return 'Must contain eight characters';

      return null;
    }

    if (p0.length < 8) {
      return 'Must contain eight characters';
    }
    return null;
  }

  static String? passwordEightCharactersValidation(String? p0) {
    if (p0 == null) {
      return 'Must contain eight characters';
    }

    if (p0.length < 8) {
      return 'Must contain eight characters';
    }
    return null;
  }
}
