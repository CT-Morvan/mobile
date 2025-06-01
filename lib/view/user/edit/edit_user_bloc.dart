import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/user/edit_user_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  EditUserBloc() : super(EditUserInitialState()) {
    on<EditUserEvent>((event, emit) async {
      emit(EditUserInitialState());
      emit(EditUserLoadingState());

      final api = EditUserApi(user: event.user);

      final response = await api.execute();
      switch (response) {
        case Success<UserModel, String>():
          emit(EditUserSuccessState(user: response.success));
        case Error<UserModel, String>():
          emit(EditUserErrorState(message: response.error));
      }
    });
  }
}
