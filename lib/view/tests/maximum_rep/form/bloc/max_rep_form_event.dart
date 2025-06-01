part of 'max_rep_form_bloc.dart';

@immutable
class MaxRepFormEvent {
  const MaxRepFormEvent();
}

final class MaxRepGetFormEvent extends MaxRepFormEvent {}

final class MaxRepSendFormEvent extends MaxRepFormEvent {
  final int? userId;
  final List<MaxRepExerciseModel> exercises;
  final DateTime date;

  const MaxRepSendFormEvent({required this.userId, required this.exercises, required this.date});
}

final class MaxRepResetStateEvent extends MaxRepFormEvent {
  final List<MaxRepExerciseModel> itens;

  const MaxRepResetStateEvent({required this.itens});
}