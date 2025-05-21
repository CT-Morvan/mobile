import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/login/login_api.dart';
import 'package:ct_morvan_app/sdk/shared_preferences_controller.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/src/result.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginInitialState());
      emit(LoginLoadingState());

      final api = LoginApi(user: event.user, password: event.password);

      final response = await api.execute();
      switch (response) {
        case Success<UserModel, String>():
          await SharedPreferencesController().saveLoggedUser(response.success);

          emit(LoginSuccessState(user: response.success));
        case Error<UserModel, String>():
          emit(LoginErrorState(message: response.error));
      }
    });
  }
}
