part of 'list_exercises_bloc.dart';

@immutable
class ListExercisesEvent {
  const ListExercisesEvent();
}

final class ListExercisesGetEvent extends ListExercisesEvent {}

final class ListExercisesDeleteEvent extends ListExercisesEvent {
  final int? exerciseId;

  const ListExercisesDeleteEvent({required this.exerciseId});
}
