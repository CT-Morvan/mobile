part of 'edit_user_bloc.dart';

@immutable
class EditUserEvent {
  final UserModel user;

  const EditUserEvent({required this.user});
}
