import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    //todo: validar se o usuario está autenticado, caso sim, segue a rota, se não volta pro login
    bool isAuthenticated = true;
    if (isAuthenticated) {
      resolver.next();
    } else {
      resolver.redirectUntil(const LoginViewRoute());
    }
  }
}
