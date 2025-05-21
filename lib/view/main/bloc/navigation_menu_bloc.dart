import 'package:bloc/bloc.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/shared_preferences_controller.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:meta/meta.dart';

part 'navigation_menu_state.dart';
part 'navigation_menu_event.dart';

class NavigationMenuBloc
    extends Bloc<NavigationMenuEvent, NavigationMenuState> {
  NavigationMenuBloc() : super(NavigationMenuStateInitial()) {
    on<NavigationMenuEvent>((event, emit) async {
      final result = await SharedPreferencesController().getLoggedUser();

      if (result == null) {
        emit(NavigationMenuStateError(message: t.genericError));
      } else {
        emit(NavigationMenuStateSuccess(user: result));
      }
    });
  }
}
