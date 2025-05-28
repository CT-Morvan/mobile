import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/user/list_users/bloc/list_users_bloc.dart';
import 'package:ct_morvan_app/view/user/widget/user_list_item_widget.dart';
import 'package:ct_morvan_app/widget/bottom_sheet/bottom_sheet_item_widget.dart';
import 'package:ct_morvan_app/widget/bottom_sheet/bottom_sheet_widget.dart';
import 'package:ct_morvan_app/widget/dialog/generic_loading_dialog.dart';
import 'package:ct_morvan_app/widget/dialog/generic_option_dialog.dart';
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
              ).showSnackBar(SnackBar(content: Text(t.genericError)));
            }
            if (state is DeleteUserStateError) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(t.deleteUserError)));
            }
            if (state is DeleteUserStateSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(t.deleteUserSuccess)));
              fetchData();
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
          UserModel user = users.toList()[index];
          return UserListItemWidget(
            user: user,
            mainOnTap:
                user.type == UserTypeEnum.admin
                    ? null
                    : () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return BottomSheetWidget(
                            title: t.storeTests,
                            itens: [
                              BottomSheetItemWidget(
                                icon: Icons.show_chart,
                                text: t.maximumRepTest,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  AutoRouter.of(context).push(
                                    MaximumRepFormViewRoute(userId: user.id),
                                  );
                                },
                              ),
                              BottomSheetItemWidget(
                                icon: Icons.show_chart,
                                text: t.bioimpedance,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  AutoRouter.of(context).push(
                                    BioimpedanceFormViewRoute(userId: user.id),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
            secondaryOnTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetWidget(
                    title: t.actions,
                    itens: [
                      BottomSheetItemWidget(
                        icon: Icons.delete,
                        text: t.delete,
                        onTap: () {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return GenericOptionDialog(
                                title: t.deleteUserTitle,
                                description: t.deleteUserDescription,
                                primaryButtonFunction: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return GenericLoadingDialog();
                                    },
                                  );
                                  _bloc.add(
                                    ListUserDeleteEvent(userId: user.id),
                                  );
                                },
                                primaryButtonText: t.delete,
                              );
                            },
                          );
                        },
                      ),
                      BottomSheetItemWidget(
                        icon: Icons.edit,
                        text: t.edit,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      BottomSheetItemWidget(
                        icon: Icons.show_chart,
                        text: t.viewTestsTitle(name: t.maximumRepTest),
                        onTap: () {
                          Navigator.of(context).pop();
                          AutoRouter.of(
                            context,
                          ).push(MaximumRepResultsViewRoute(user: user));
                        },
                      ),
                      BottomSheetItemWidget(
                        icon: Icons.show_chart,
                        text: t.viewTestsTitle(name: t.bioimpedance),
                        onTap: () {
                          Navigator.of(context).pop();
                          AutoRouter.of(
                            context,
                          ).push(BioimpedanceResultViewRoute(user: user));
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
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
    _bloc.add(ListUsersGetEvent());
  }
}
