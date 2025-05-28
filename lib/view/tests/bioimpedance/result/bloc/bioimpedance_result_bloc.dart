import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/sdk/api/bioimpedance/bioimpedance_list_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'bioimpedance_result_event.dart';
part 'bioimpedance_result_state.dart';

class BioimpedanceResultBloc
    extends Bloc<BioimpedanceResultEvent, BioimpedanceResultState> {
  BioimpedanceResultBloc() : super(BioimpedanceResultStateInitial()) {
    on<BioimpedanceResultEvent>((event, emit) async {
      emit(BioimpedanceResultStateLoading());

      final result = await BioimpedanceListApi(userId: event.userId).execute();

      switch (result) {
        case Success<List<BioimpedanceModel>, String>():
          emit(BioimpedanceResultStateSuccess(list: result.success));
        case Error<List<BioimpedanceModel>, String>():
          emit(BioimpedanceResultStateError(message: result.error));
      }
    });
  }
}
