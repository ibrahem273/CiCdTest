import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

// import 'get_notification_model'
// OneSignal App ID
// 91cdd1d3-0d66-446c-bfd9-9ceeca3bb76a
// 91cdd1d3-0d66-446c-bfd9-9ceeca3bb76a
// Rest API Key
// GetIt.I<PrefsRepository>().setFcmToken(value!.userId!);
// 9991e16a-068a-4164-be5d-cce6d1dd1c98
class OneSignalService {
  static Future<void> initOneSignal() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Notifications.requestPermission(true);
    OneSignal.initialize('70a72a6a-2d83-424c-b072-1744a2bb30a6');

    Future.delayed(const Duration(seconds: 5)).then((value) {
      debugPrint(
          "OneSignal.User.pushSubscription.id${OneSignal.User.pushSubscription.id}");

      // GetIt.I<PrefsRepository>()
      //     .setFcmToken(OneSignal.User.pushSubscription.id ?? '');
    });
  }

  clickNotificatio() {
    OneSignal.Notifications.addClickListener((event) {});
  }

  static sad() {
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {});
  }
}
