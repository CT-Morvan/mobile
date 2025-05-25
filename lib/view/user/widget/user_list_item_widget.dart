import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/bottom_sheet/bottom_sheet_item_widget.dart';
import 'package:ct_morvan_app/widget/bottom_sheet/bottom_sheet_widget.dart';
import 'package:ct_morvan_app/widget/user_image_widget.dart';
import 'package:flutter/material.dart';

class UserListItemWidget extends StatelessWidget {
  final UserModel user;
  const UserListItemWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap:
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
                            text: t.maximumRepTest,
                            onTap: () {
                              Navigator.of(context).pop();
                              AutoRouter.of(
                                context,
                              ).push(MaximumRepFormViewRoute(userId: user.id));
                            },
                          ),
                          BottomSheetItemWidget(
                            text: t.bioimpedance,
                            onTap: () {
                              Navigator.of(context).pop();
                              AutoRouter.of(
                                context,
                              ).push(MaximumRepFormViewRoute(userId: user.id));
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: UserImageWidget(size: 54, borderWidth: 2),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                    Text(
                      _getEmailAndType(),
                      style: TextStyle(fontSize: 14, color: grayColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetWidget(
                        title: t.storeTests,
                        itens: [
                          BottomSheetItemWidget(
                            text: t.viewTestsTitle(name: t.maximumRepTest),
                            onTap: () {
                              Navigator.of(context).pop();
                              AutoRouter.of(
                                context,
                              ).push(MaximumRepResultsViewRoute(user: user));
                            },
                          ),
                          BottomSheetItemWidget(
                            text: t.viewTestsTitle(name: t.bioimpedance),
                            onTap: () {
                              Navigator.of(context).pop();
                              AutoRouter.of(
                                context,
                              ).push(MaximumRepFormViewRoute(userId: user.id));
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getEmailAndType() {
    final email = user.email ?? "";
    final type = user.type.toString();

    return "$email • $type";
  }
}
