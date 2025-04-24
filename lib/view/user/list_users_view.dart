import 'package:flutter/material.dart';

class ListUsersView extends StatefulWidget {
  const ListUsersView({super.key});
  @override
  State<ListUsersView> createState() => _ListUsersViewState();
}

class _ListUsersViewState extends State<ListUsersView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("ListUsersView"));
  }
}
