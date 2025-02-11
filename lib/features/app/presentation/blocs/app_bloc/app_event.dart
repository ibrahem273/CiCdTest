// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
sealed class AppBlocEvent {}

class ChangeFullShellNavigationPageEvent extends AppBlocEvent {
  final int pageIndex;
  ChangeFullShellNavigationPageEvent({required this.pageIndex});
}

class ChangeClientIdEvent extends AppBlocEvent {
  final int id;
  ChangeClientIdEvent({required this.id});
}

class ChangeGroupLeaderIdEvent extends AppBlocEvent {
  final int id;
  ChangeGroupLeaderIdEvent({required this.id});
}

class ChangeTeamLeadersIdEvent extends AppBlocEvent {
  final int id;
  ChangeTeamLeadersIdEvent({required this.id});
}

class ChangeTeamsLeadersIdEvent extends AppBlocEvent {
  final int id;
  ChangeTeamsLeadersIdEvent({required this.id});
}

class ChangeTheCurrentUserIdEvent extends AppBlocEvent {
 final  int theCurrentUserId;
 ChangeTheCurrentUserIdEvent({required this.theCurrentUserId});
}
