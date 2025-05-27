import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/user/list_users/bloc/list_users_bloc.dart';
import 'package:ct_morvan_app/view/user/widget/user_list_item_widget.dart';
import 'package:ct_morvan_app/widget/fullscreen_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "ListUsersViewRoute")
class ListUsersView extends StatefulWidget {
  const ListUsersView({super.key});
  @override
  State<ListUsersView> createState() => _ListUsersViewState();
}

class _ListUsersViewState extends State<ListUsersView> {
  final ListUsersBloc _bloc = ListUsersBloc();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [Tab(text: t.patient(n: 2)), Tab(text: t.admin(n: 2))],
        ),
        body: BlocConsumer<ListUsersBloc, ListUsersState>(
          listener: (context, state) {
            if (state is ListUsersStateError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          bloc: _bloc,
          builder: (context, state) {
            if (state is ListUsersStateSuccess) {
              if (state.list.isEmpty) {
                return FullscreenMessageWidget(
                  title: t.usersListEmpty,
                  buttonText: t.createUser,
                  buttonAction: () {
                    AutoRouter.of(context).push(CreateUserViewRoute()).then((
                      _,
                    ) {
                      fetchData();
                    });
                  },
                );
              }

              final Iterable<UserModel> patients = state.list.where(
                (e) => e.type == UserTypeEnum.patient,
              );
              final Iterable<UserModel> admins = state.list.where(
                (e) => e.type == UserTypeEnum.admin,
              );

              return TabBarView(
                children: [
                  getTab(patients, t.patientsListEmpty, t.createPatient),
                  getTab(admins, t.adminListEmpty, t.createAdmin),
                ],
              );
            }

            if (state is ListUsersStateError) {
              return FullscreenMessageWidget(
                title: t.genericError,
                buttonText: t.tryAgain,
                buttonAction: () {
                  fetchData();
                },
                icon: Icon(
                  Icons.warning_amber_outlined,
                  size: 128,
                  color: grayColor,
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(CreateUserViewRoute()).then((_) {
              fetchData();
            });
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget getTab(
    Iterable<UserModel> users,
    String listEmptyMessage,
    String listEmptyTextButton,
  ) {
    if (users.isNotEmpty) {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (buildContext, index) {
          return UserListItemWidget(user: users.toList()[index]);
        },
        itemCount: users.length,
      );
    }
    return FullscreenMessageWidget(
      title: listEmptyMessage,
      buttonText: listEmptyTextButton,
      buttonAction: () {
        AutoRouter.of(context).push(CreateUserViewRoute()).then((_) {
          fetchData();
        });
      },
    );
  }

  void fetchData() {
    _bloc.add(ListUsersEvent());
  }
}
