import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'language_event.dart';
part 'language_state.dart';

@LazySingleton()
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(state.copyWith(currentLocale: event.currentLanguage));
    });
  }
}
