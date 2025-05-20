import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/tests/tests_view.dart';
import 'package:ct_morvan_app/view/user/list_users_view.dart';
import 'package:ct_morvan_app/view/user/user_view.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "NavigationMenuViewRoute")
class NavigationMenuView extends StatefulWidget {
  const NavigationMenuView({super.key});
  @override
  State<NavigationMenuView> createState() => _NavigationMenuViewState();
}

class _NavigationMenuViewState extends State<NavigationMenuView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    //todo: essa tela aq so vai ser exibida por users comuns
    TestsView(),
    //todo: essa tela so vai ser exibida se o usuario for adm
    ListUsersView(),
    UserView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: BottomNavigationBar(
            backgroundColor: whiteColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: t.tests),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: t.users),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Lucas",
              ), //todo: colocar nome do user logado
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: primaryColor,
            onTap: _onItemTapped,
          ),
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
    );
  }
}
