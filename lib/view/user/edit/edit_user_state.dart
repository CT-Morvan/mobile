part of 'edit_user_bloc.dart';

@immutable
sealed class EditUserState {}

final class EditUserInitialState extends EditUserState {}

final class EditUserLoadingState extends EditUserState {}

final class EditUserErrorState extends EditUserState {
  final String message;

  EditUserErrorState({required this.message});
}

final class EditUserSuccessState extends EditUserState {
  final UserModel user;

  EditUserSuccessState({required this.user});
}
