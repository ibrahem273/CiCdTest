import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  static LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();

  final Locale? locale;

  AppLocalization({this.locale});

  static AppLocalization? of(BuildContext context) {
    //todo tell flutter that this class for localization
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  late Map<String, String> _localizationString;

  Future loadJsonLanguage() async {
    try {
      debugPrint("afphiafsd${locale!.languageCode}");
      String jsonString = await rootBundle
          .loadString('assets/languages/${locale!.languageCode}.json');

      Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      _localizationString =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      debugPrint("messageError${e.toString()}");
    }
  }

  String translate(String key) => _localizationString[key] ?? "";
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    debugPrint("poijasdoin${locale.toString()}");
//todo check wither the locale you provided  in main.dart is suported on this app
    return ['en', 'ar'].contains(locale.toString());
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale: locale);

    await localization.loadJsonLanguage();

    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}
