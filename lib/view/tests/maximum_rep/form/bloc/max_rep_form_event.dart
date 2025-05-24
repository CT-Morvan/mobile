part of 'max_rep_form_bloc.dart';

@immutable
class MaxRepFormEvent {
  const MaxRepFormEvent();
}

final class MaxRepGetFormEvent extends MaxRepFormEvent {}

final class MaxRepSendFormEvent extends MaxRepFormEvent {
  final int? userId;
  final List<ExerciseModel> exercises;

  const MaxRepSendFormEvent({required this.userId, required this.exercises});
}

final class MaxRepResetStateEvent extends MaxRepFormEvent {
  final List<ExerciseModel> itens;

  const MaxRepResetStateEvent({required this.itens});
}