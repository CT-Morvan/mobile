import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Widget|Page,Route")
class CtMorvanRoutes extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginViewRoute.page, initial: true),
    AutoRoute(page: FirstLoginViewRoute.page),
    AutoRoute(page: ChangePasswordViewRoute.page),
    AutoRoute(page: NavigationMenuViewRoute.page),
    AutoRoute(page: MaximumRepResultsViewRoute.page),
    AutoRoute(page: MaximumRepFormViewRoute.page),
    AutoRoute(page: TestsViewRoute.page),
    AutoRoute(page: CreateUserViewRoute.page),
    AutoRoute(page: ListUsersViewRoute.page),
    AutoRoute(page: UserViewRoute.page),
  ];
}
