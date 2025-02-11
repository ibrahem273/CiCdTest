import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_app/config/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@LazySingleton()
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ChangeTheme>((event, emit) {
      emit(state.copyWith(
          currentTheme: state.currentTheme == AppTheme.light
              ? AppTheme.dark
              : AppTheme.light));

      // TODO: implement event handler
    });
  }
}
