import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/view/tests/tests_view.dart';
import 'package:ct_morvan_app/view/user/list_users_view.dart';
import 'package:ct_morvan_app/view/user/user_view.dart';
import 'package:flutter/material.dart';

class NavigationMenuView extends StatefulWidget {
  const NavigationMenuView({super.key});
  @override
  State<NavigationMenuView> createState() => _NavigationMenuViewState();
}

class _NavigationMenuViewState extends State<NavigationMenuView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TestsView(),
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
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text("CT Morvan"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.help_outline_outlined),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: BottomNavigationBar(
            backgroundColor: whiteColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "testes"),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "Usuários",
              ),
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
