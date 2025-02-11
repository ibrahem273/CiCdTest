// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get_it/get_it.dart';
// import 'package:thaki/core/domain/prefs_repository.dart';
// import 'package:thaki/firebase_options.dart';
// // import 'package:thaki/firebase_options.dart';
// @pragma('vm:entry-point')
// class LocalNotificationService {
//   static final _localNotificationPlugin = FlutterLocalNotificationsPlugin();
//   final String _androidChannelId = r'$_$_1_$_$';
//   final String _androidChannelName = "Notification";
//   static FlutterLocalNotificationsPlugin get localNotificationPlugin =>
//       _localNotificationPlugin;
//   AndroidNotificationChannel get getAndroidChannel =>
//       AndroidNotificationChannel(
//         _androidChannelId,
//         _androidChannelName, // title
//         importance: Importance.max,
//         playSound: true,
//         enableVibration: true,
//       );



//   static Future<RemoteMessage?> initFirebase() async {
//     await Firebase.initializeApp( options:  DefaultFirebaseOptions.currentPlatform);
//     final fcmToken = await FirebaseMessaging.instance.getToken();


//     log(fcmToken!,name: 'fcmToken');


//     await GetIt.I<PrefsRepository>().setFcmToken(fcmToken!);

//     await LocalNotificationService.initialize();

//     return   FirebaseMessaging.instance.getInitialMessage();


//   }
//   static Future<void> initialize() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//     AndroidInitializationSettings('app_icon');

//     DarwinInitializationSettings iosInitializationSettings =
//     const DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     final InitializationSettings settings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );

//     await _localNotificationPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(
//         LocalNotificationService().getAndroidChannel);

//     await _localNotificationPlugin.initialize(
//       settings,
//       onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
//       onDidReceiveNotificationResponse: _onSelectNotificationNotTerminated,
//     );
//   }
//   _notificationDetails() {
//     final channel = LocalNotificationService().getAndroidChannel;

//     AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(icon: 'app_icon',
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       ticker: 'ticker',
//       importance: channel.importance,
//       priority: Priority.max,
//       playSound: channel.playSound,
//       enableVibration: channel.enableVibration,
//     );
//     const DarwinNotificationDetails iosNotificationDetails =
//     DarwinNotificationDetails();

//     return NotificationDetails(
//         android: androidNotificationDetails, iOS: iosNotificationDetails);
//   }


//   @pragma('vm:entry-point')
//   static void _onSelectNotification(NotificationResponse notificationResponse) {
//   }


//   @pragma('vm:entry-point')
//   static void _onSelectNotificationNotTerminated(NotificationResponse notificationResponse) {}






//   @pragma('vm:entry-point')
//   Future<void> showNotificationWithPayload({required Map<String,dynamic> message}) async {}


// }