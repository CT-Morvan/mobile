import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/create_user_api.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'create_user_state.dart';
part 'create_user_event.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc() : super(CreateUserStateInitial()) {
    on<CreateUserEvent>((event, emit) async {
      emit(CreateUserStateLoading());

      final type = event.isAdmin ? UserTypeEnum.admin : UserTypeEnum.patient;

      final response =
          await CreateUserApi(
            userName: event.userName,
            email: event.email,
            password: event.password,
            type: type,
          ).execute();

      switch (response) {
        case Success<UserModel, String>():
          emit(CreateUserStateSuccess(user: response.success));
        case Error<UserModel, String>():
          emit(CreateUserStateError(message: response.error));
      }
    });
  }
}
