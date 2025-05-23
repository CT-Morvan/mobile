part of 'create_user_bloc.dart';

@immutable
class CreateUserEvent {
  final String userName;
  final String email;
  final String password;
  final bool isAdmin;
  
  const CreateUserEvent({
    required this.userName,
    required this.email,
    required this.password,
    required this.isAdmin,
  });
}
