import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/main/bloc/navigation_menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "NavigationMenuViewRoute")
class NavigationMenuView extends StatefulWidget {
  const NavigationMenuView({super.key});
  @override
  State<NavigationMenuView> createState() => _NavigationMenuViewState();
}

class _NavigationMenuViewState extends State<NavigationMenuView> {
  final NavigationMenuBloc _bloc = NavigationMenuBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(NavigationMenuEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<NavigationMenuBloc, NavigationMenuState>(
        listener: (context, state) {
          if (state is NavigationMenuStateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          if (state is NavigationMenuStateSuccess) {
            return AutoTabsRouter(
              routes: [
                if (state.user.type == UserTypeEnum.patient) ...[
                  TestsViewRoute(user: state.user),
                ] else ...[
                  ListUsersViewRoute(),
                ],
                UserViewRoute(user: state.user),
              ],
              transitionBuilder:
                  (context, child, animation) =>
                      FadeTransition(opacity: animation, child: child),
              builder: (context, child) {
                final tabsRouter = AutoTabsRouter.of(context);

                return Scaffold(
                  appBar: AppBar(
                    title: Text(t.ctMorvan),
                    automaticallyImplyLeading: false,
                  ),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: BottomNavigationBar(
                      backgroundColor: whiteColor,
                      items: [
                        if (state.user.type == UserTypeEnum.patient) ...[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: t.tests,
                          ),
                        ] else ...[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.people),
                            label: t.users,
                          ),
                        ],
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: state.user.name,
                        ),
                      ],
                      currentIndex: tabsRouter.activeIndex,
                      selectedItemColor: primaryColor,
                      onTap: (index) {
                        tabsRouter.setActiveIndex(index);
                      },
                    ),
                  ),
                  body: child,
                );
              },
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.ctMorvan),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.help_outline_outlined, color: Colors.white),
                ),
              ],
            ),
            body: Center(child: CircularProgressIndicator(color: primaryColor)),
          );
        },
      ),
    );
  }
}
