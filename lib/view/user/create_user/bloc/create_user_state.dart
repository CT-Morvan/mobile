part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserState {}

final class CreateUserStateInitial extends CreateUserState {}

final class CreateUserStateLoading extends CreateUserState {}

final class CreateUserStateError extends CreateUserState {
  final String message;

  CreateUserStateError({required this.message});
}

final class CreateUserStateSuccess extends CreateUserState {
  final UserModel user;

  CreateUserStateSuccess({required this.user});
}
