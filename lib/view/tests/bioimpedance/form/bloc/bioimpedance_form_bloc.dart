import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/sdk/api/bioimpedance_store_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'bioimpedance_form_event.dart';
part 'bioimpedance_form_state.dart';

class BioimpedanceFormBloc
    extends Bloc<BioimpedanceFormEvent, BioimpedanceFormState> {
  BioimpedanceFormBloc() : super(BioimpedanceFormStateInitial()) {
    on<BioimpedanceFormEvent>((event, emit) async {
      emit(BioimpedanceFormStateLoading());

      final result =
          await BioimpedanceStoreApi(
            userId: event.userId,
            bioimpedanceModel: event.bioimpedance,
          ).execute();

      switch (result) {
        case Success<BioimpedanceModel, String>():
          emit(BioimpedanceFormStateSuccess());
        case Error<BioimpedanceModel, String>():
          emit(BioimpedanceFormStateError(message: result.error));
      }
    });
  }
}
