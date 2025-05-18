import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/sdk/shared_preferences_controller.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final user = await SharedPreferencesController().getLoggedUser();

    bool isAuthenticated =
        user != null && user.token != null && user.token!.isNotEmpty;

    if (isAuthenticated) {
      resolver.next();
    } else {
      resolver.redirectUntil(const LoginViewRoute());
    }
  }
}
