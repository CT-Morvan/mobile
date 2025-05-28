part of 'list_users_bloc.dart';

@immutable
class ListUsersEvent {
  const ListUsersEvent();
}

final class ListUsersGetEvent extends ListUsersEvent {}

final class ListUserDeleteEvent extends ListUsersEvent {
  final int? userId;

  const ListUserDeleteEvent({required this.userId});
}
