// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
class AppState {
  final int currentPageInFullShellBottomNavigation;

  int? currentGroupLeaderId;
  int? currentClientId;

  int? currentTeamsLeaderId;
  int? currentTeamesLeaders;
  int? theCurrentUserId;

  AppState(
      {this.theCurrentUserId,
      currentGroupLeaderId,
      currentClientId,
      currentTeamsLeaderId,
      currentTeamesLeaders,
      this.currentPageInFullShellBottomNavigation = 0});

  AppState copyWith(
          {int? theCurrentUserId,
          int? currentGroupLeaderId,
          int? currentClientId,
          int? currentTeamsLeaderId,
          int? currentTeamesLeaders,
          int? currentPageInFullShellBottomNavigation}) =>
      AppState(
          theCurrentUserId: theCurrentUserId ?? this.theCurrentUserId,
          currentGroupLeaderId:
              currentGroupLeaderId ?? this.currentGroupLeaderId,
          currentClientId: currentClientId ?? this.currentClientId,
          currentTeamsLeaderId:
              currentTeamsLeaderId ?? this.currentTeamsLeaderId,
          currentTeamesLeaders:
              currentTeamesLeaders ?? this.currentTeamesLeaders,
          currentPageInFullShellBottomNavigation:
              currentPageInFullShellBottomNavigation ??
                  this.currentPageInFullShellBottomNavigation);
}
