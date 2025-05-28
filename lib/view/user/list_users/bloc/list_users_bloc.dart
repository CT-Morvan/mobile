import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/generic_message.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/delete_user_api.dart';
import 'package:ct_morvan_app/sdk/api/list_users_api.dart';
import 'package:ct_morvan_app/sdk/shared_preferences_controller.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';

part 'list_users_state.dart';
part 'list_users_event.dart';

class ListUsersBloc extends Bloc<ListUsersEvent, ListUsersState> {
  ListUsersBloc() : super(ListUsersStateInitial()) {
    on<ListUsersGetEvent>((event, emit) async {
      emit(ListUsersStateLoading());

      final api = ListUsersApi();

      final response = await api.execute();

      switch (response) {
        case Success<List<UserModel>, String>():
          final loggedUser =
              await SharedPreferencesController().getLoggedUser();

          response.success.removeWhere(
            (element) => element.id == loggedUser?.id,
          );

          emit(ListUsersStateSuccess(list: response.success));
        case Error<List<UserModel>, String>():
          emit(ListUsersStateError(message: response.error));
      }
    });
    on<ListUserDeleteEvent>((event, emit) async {
      emit(DeleteUserStateLoading());

      final api = DeleteUserApi(userId: event.userId);

      final response = await api.execute();

      switch (response) {
        case Success<GenericMessage, String>():
          emit(DeleteUserStateSuccess());
        case Error<GenericMessage, String>():
          emit(DeleteUserStateError(message: response.error));
      }
    });
  }
}
