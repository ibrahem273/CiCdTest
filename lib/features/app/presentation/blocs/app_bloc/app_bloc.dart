import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppBlocEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<ChangeTheCurrentUserIdEvent>((event, emit) {
      emit(state.copyWith(theCurrentUserId: event.theCurrentUserId));
    });

    on<ChangeFullShellNavigationPageEvent>((event, emit) {
      debugPrint("asdasdasdas");
      emit(state.copyWith(
          currentPageInFullShellBottomNavigation: event.pageIndex));
    });

    on<ChangeClientIdEvent>((event, emit) {
      emit(state.copyWith(currentClientId: event.id));
    });

    on<ChangeGroupLeaderIdEvent>((event, emit) {
      emit(state.copyWith(currentGroupLeaderId: event.id));
    });

    on<ChangeTeamLeadersIdEvent>((event, emit) {
      emit(state.copyWith(currentTeamsLeaderId: event.id));
    });

    on<ChangeTeamsLeadersIdEvent>((event, emit) {
      emit(state.copyWith(currentTeamesLeaders: event.id));
    });
  }
}
