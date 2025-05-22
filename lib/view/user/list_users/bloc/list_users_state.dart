part of 'list_users_bloc.dart';

@immutable
sealed class ListUsersState {}

final class ListUsersStateInitial extends ListUsersState {}

final class ListUsersStateLoading extends ListUsersState {}

final class ListUsersStateError extends ListUsersState {
  final String message;

  ListUsersStateError({required this.message});
}

final class ListUsersStateSuccess extends ListUsersState {
  final List<UserModel> list;

  ListUsersStateSuccess({required this.list});
}
