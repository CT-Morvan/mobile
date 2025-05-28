import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/exercises/exercise_model.dart';
import 'package:ct_morvan_app/models/generic_message.dart';
import 'package:ct_morvan_app/sdk/api/exercises/delete_exercise_api.dart';
import 'package:ct_morvan_app/sdk/api/exercises/list_exercises_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'list_exercises_state.dart';
part 'list_exercises_event.dart';

class ListExercisesBloc extends Bloc<ListExercisesEvent, ListExercisesState> {
  ListExercisesBloc() : super(ListExercisesStateInitial()) {
    on<ListExercisesGetEvent>((event, emit) async {
      emit(ListExercisesStateLoading());

      final api = ListExercisesApi();

      final response = await api.execute();

      switch (response) {
        case Success<List<ExerciseModel>, String>():
          emit(ListExercisesStateSuccess(list: response.success));
        case Error<List<ExerciseModel>, String>():
          emit(ListExercisesStateError(message: response.error));
      }
    });
    on<ListExercisesDeleteEvent>((event, emit) async {
      emit(DeleteExerciseStateLoading());

      final api = DeleteExerciseApi(exerciseId: event.exerciseId);

      final response = await api.execute();

      switch (response) {
        case Success<GenericMessage, String>():
          emit(DeleteExerciseStateSuccess());
        case Error<GenericMessage, String>():
          emit(DeleteExerciseStateError(message: response.error));
      }
    });
  }
}
