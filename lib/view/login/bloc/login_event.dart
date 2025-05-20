part of 'login_bloc.dart';

@immutable
class LoginEvent {
  final String user;
  final String password;

  const LoginEvent({required this.user, required this.password});
}
