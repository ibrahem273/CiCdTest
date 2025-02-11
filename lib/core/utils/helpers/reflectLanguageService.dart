import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

reflectLanguageValues({required String currentLanguageCode}) async {
  final jsonString = await rootBundle.loadString('assets/languages/ar.json');

  // Read the file containing the original map
  // final file = File('../../../../assets/languages/ar.json');
  // final jsonString = await file.readAsString();

  // Parse the JSON string to get the original map
  final originalMap = json.decode(jsonString);

  // Create a new map with keys and values swapped
  final swappedMap = <String, String>{};
  originalMap.forEach((key, value) {
    swappedMap[value] = key;
  });

  // GetIt.I<SettingsBloc>()
  //     .add(ReadReflectLanguageEvent(reflectLangugae: swappedMap));
  // Print the swapped map
}
