import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/main/bloc/navigation_menu_bloc.dart';
import 'package:ct_morvan_app/view/tests/tests_view.dart';
import 'package:ct_morvan_app/view/user/list_users_view.dart';
import 'package:ct_morvan_app/view/user/user_view.dart';
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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            return Scaffold(
              appBar: AppBar(
                title: Text(t.ctMorvan),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.help_outline_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
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
                  currentIndex: _selectedIndex,
                  selectedItemColor: primaryColor,
                  onTap: _onItemTapped,
                ),
              ),
              body: Center(
                child: [
                  if (state.user.type == UserTypeEnum.patient) ...[
                    TestsView(),
                  ] else ...[
                    ListUsersView(),
                  ],
                  UserView(user: state.user),
                ].elementAt(_selectedIndex),
              ),
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
