part of 'theme_bloc.dart';

@immutable
 class ThemeState {


  ThemeData? currentTheme ;
  // static const  s=AppTheme.light;
  ThemeState({this.currentTheme});


ThemeState copyWith ({  ThemeData? currentTheme })
{

 return ThemeState(currentTheme: currentTheme??this.currentTheme);

}

}

