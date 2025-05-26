import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/routes/auth_guard.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Widget|Page,Route")
class CtMorvanRoutes extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: NavigationMenuViewRoute.page,
      initial: true,
      children: [
        AutoRoute(page: TestsViewRoute.page),
        AutoRoute(page: ListUsersViewRoute.page),
        AutoRoute(page: UserViewRoute.page),
      ],
      guards: [AuthGuard()],
    ),
    AutoRoute(page: LoginViewRoute.page),
    AutoRoute(page: FirstLoginViewRoute.page),
    AutoRoute(page: ChangePasswordViewRoute.page),
    AutoRoute(page: MaximumRepResultsViewRoute.page),
    AutoRoute(page: MaximumRepFormViewRoute.page),
    AutoRoute(page: TestsViewRoute.page),
    AutoRoute(page: CreateUserViewRoute.page),
    AutoRoute(page: ListUsersViewRoute.page),
    AutoRoute(page: UserViewRoute.page),
    AutoRoute(page: BioimpedanceFormViewRoute.page),
    AutoRoute(page: BioimpedanceResultViewRoute.page),
  ];
}
