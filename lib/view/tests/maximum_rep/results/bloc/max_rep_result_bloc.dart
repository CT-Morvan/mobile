import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_result_model.dart';
import 'package:ct_morvan_app/sdk/api/max_rep_result_api.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'max_rep_result_event.dart';
part 'max_rep_result_state.dart';

class MaxRepResultBloc extends Bloc<MaxRepResultEvent, MaxRepResultState> {
  MaxRepResultBloc() : super(MaxRepResultStateInitial()) {
    on<MaxRepResultEvent>((event, emit) async {
      emit(MaxRepResultStateLoading());

      if (event.userId == null) {
        emit(MaxRepResultStateError(message: t.genericError));
      }

      final result = await MaxRepResultApi(userId: event.userId).execute();

      switch (result) {
        case Success<List<MaximumRepResultModel>, String>():
          emit(MaxRepResultStateSuccess(list: result.success));
        case Error<List<MaximumRepResultModel>, String>():
          emit(MaxRepResultStateError(message: result.error));
      }
    });
  }
}
