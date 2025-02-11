part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}
class ChangeLanguageEvent extends LanguageEvent
{
  Locale currentLanguage;

  ChangeLanguageEvent({required this.currentLanguage});
}