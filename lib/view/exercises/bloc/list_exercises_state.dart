part of 'list_exercises_bloc.dart';

@immutable
sealed class ListExercisesState {}

final class ListExercisesStateInitial extends ListExercisesState {}

final class ListExercisesStateLoading extends ListExercisesState {}

final class ListExercisesStateError extends ListExercisesState {
  final String message;

  ListExercisesStateError({required this.message});
}

final class ListExercisesStateSuccess extends ListExercisesState {
  final List<ExerciseModel> list;

  ListExercisesStateSuccess({required this.list});
}

final class DeleteExerciseStateLoading extends ListExercisesState {}

final class DeleteExerciseStateError extends ListExercisesState {
  final String message;

  DeleteExerciseStateError({required this.message});
}

final class DeleteExerciseStateSuccess extends ListExercisesState {}
