part of 'language_bloc.dart';

 class LanguageState {
// var s=BuildContext.locale
  Locale? currentLocale;
  LanguageState({currentLocale=const Locale('ar')});







  LanguageState copyWith ({  Locale? currentLocale })
  {

   return LanguageState(currentLocale: currentLocale??this.currentLocale);

  }


}

