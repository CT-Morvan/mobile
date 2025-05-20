import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_form_model.dart';
import 'package:ct_morvan_app/sdk/api/max_rep/max_rep_get_form_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/src/result.dart';

part 'max_rep_form_event.dart';
part 'max_rep_form_state.dart';

class MaxRepFormBloc extends Bloc<MaxRepGetFormEvent, MaxRepFormState> {
  MaxRepFormBloc() : super(MaxRepInitialState()) {
    on<MaxRepGetFormEvent>((event, emit) async {
      emit(MaxRepLoadingState());

      final result = await MaxRepGetFormApi().execute();

      switch (result) {
        case Success<MaxRepFormModel, String>():
          emit(MaxRepGetFormSuccessState(list: result.success));
        case Error<MaxRepFormModel, String>():
          emit(MaxRepGetFormErrorState(message: result.error));
      }
    });
  }
}
