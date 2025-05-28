import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_exercise_model.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_create_model.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_form_model.dart';
import 'package:ct_morvan_app/sdk/api/max_rep/max_rep_form_store_api.dart';
import 'package:ct_morvan_app/sdk/api/max_rep/max_rep_get_form_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'max_rep_form_event.dart';
part 'max_rep_form_state.dart';

class MaxRepFormBloc extends Bloc<MaxRepFormEvent, MaxRepFormState> {
  MaxRepFormBloc() : super(MaxRepInitialState()) {
    on<MaxRepGetFormEvent>((event, emit) async {
      emit(MaxRepLoadingState());

      final result = await MaxRepGetFormApi().execute();

      switch (result) {
        case Success<MaxRepFormModel, String>():
          emit(MaxRepGetFormSuccessState(list: result.success.data));
        case Error<MaxRepFormModel, String>():
          emit(MaxRepGetFormErrorState(message: result.error));
      }
    });
    on<MaxRepSendFormEvent>((event, emit) async {
      emit(MaxRepLoadingState());

      List<MaxRepCreateModel> maxRepForm = [];

      for (final exercise in event.exercises) {
        maxRepForm.add(exercise.toMaxRepCreateModel());
      }

      final result =
          await MaxRepFormStoreApi(
            userId: event.userId,
            maximums: maxRepForm,
          ).execute();

      switch (result) {
        case Success<MaxRepFormModel, String>():
          emit(MaxRepSendFormSuccessState());
        case Error<MaxRepFormModel, String>():
          emit(MaxRepGetFormErrorState(message: result.error));
      }
    });
    on<MaxRepResetStateEvent>((event, emit) async {
      emit(MaxRepGetFormSuccessState(list: event.itens));
    });
  }
}
