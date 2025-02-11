import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {





static Future<void> customLaunchUrl(
      {required String url}) async {
    // String url = 'whatsapp://send?phone=$number&text=$message';

    await launch(url);
  }



  static Future<void> launchWhatApp(
      {required String number, String message = ''}) async {
    String url = 'whatsapp://send?phone=$number&text=$message';

    await launch(url);
  }




  static Future<void> launchPhoneNumber({
    required String phoneNumber,
  }) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);

    await launchUrl(launchUri);
  }
}
