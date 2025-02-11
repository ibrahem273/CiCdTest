class RouterConfiguration {
  RouterConfiguration.init();

  static String kRootRoute = '/ngrok';

  final applicationRoutes = _ApplicationRoutes();
}

class _ApplicationRoutes {

  final String kAboutUsScreen= '/aboutUsScreen';


  final String kAdsHomeScreen= '/adsHomeScreen';
  final String kAdsDetailsScreen= 'adsDetailsScreen';


//todo profile
  final String kHomeProfileScreen = '/homeProfileScreen';

  final String kProfileInfoScreen = 'profileInfoScreen';
  final String kEditProfileInfoScreen = 'editProfileInfoScreen';



  final String kSavedCardScreen = 'savedCardScreen';
  final String kChangePassword = 'changePassword';
  final String kEditProfileScreen = 'EditProfileScreen';
  // final String kHomeProfileScreen='/homeProfileScreen';


//todo auth
  final String kAuth = '/auth';

  final String kRegisterScreen = 'registerScreen';
  final String kRegisterPersonalInfoScreen = 'registerPersonalInfoScreen';

  final String kLoginScreen = 'loginScreen';
  final String kForgetPasswordScreen = 'forgetPassword';

//todo home
  final String kHomeScreen = '/homeScreen';
  final String kSplash = '/splash';
  final String kNotificationsScreen = 'notification_screen';

  final String kSubjectLecturesScreen = 'subject_lectures_screen';
  final String kQuestionsScreen = 'questions_screen';

}
