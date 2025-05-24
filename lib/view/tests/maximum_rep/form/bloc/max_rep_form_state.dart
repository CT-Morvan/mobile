part of 'max_rep_form_bloc.dart';

@immutable
sealed class MaxRepFormState {}

final class MaxRepInitialState extends MaxRepFormState {}

final class MaxRepLoadingState extends MaxRepFormState {}

final class MaxRepGetFormErrorState extends MaxRepFormState {
  final String message;

  MaxRepGetFormErrorState({required this.message});
}

final class MaxRepGetFormSuccessState extends MaxRepFormState {
  final List<ExerciseModel>? list;
  MaxRepGetFormSuccessState({required this.list});
}

final class MaxRepSendFormSuccessState extends MaxRepFormState {
  MaxRepSendFormSuccessState();
}
