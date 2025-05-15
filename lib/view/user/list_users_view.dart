import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/view/user/create_user_view.dart';
import 'package:ct_morvan_app/view/user/widget/user_list_item_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "ListUsersViewRoute")
class ListUsersView extends StatefulWidget {
  const ListUsersView({super.key});
  @override
  State<ListUsersView> createState() => _ListUsersViewState();
}

class _ListUsersViewState extends State<ListUsersView> {
  List<UserModel> users = [
    UserModel(name: "Lucas Sabino", pictureUrl: "https://picsum.photos/200"),
    UserModel(name: "Bruno Fischer", pictureUrl: "https://picsum.photos/200"),
    UserModel(name: "Matheus Grawe", pictureUrl: "https://picsum.photos/200"),
    UserModel(
      name:
          "Matheus Grawe Matheus GraweMatheus GraweMatheus GraweMatheus Grawe",
      pictureUrl: "https://picsum.photos/200",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (buildContext, index) {
          return UserListItemWidget(user: users[index]);
        },
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateUserView()))
              .then((_) {
                fetchData();
              });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void fetchData() {
    //todo: implementar bloc
  }
}
