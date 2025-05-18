part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}

final class LoginSuccessState extends LoginState {
  final String token;

  LoginSuccessState({required this.token});
}
