import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/sdk/sdk.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:ct_morvan_app/widget/secondary_button_widget.dart';
import 'package:ct_morvan_app/widget/user_image_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "UserViewRoute")
class UserView extends StatefulWidget {
  final UserModel user;
  const UserView({required this.user, super.key});
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: UserImageWidget(size: 200, borderWidth: 4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              widget.user.name ?? "",
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
          Text(
            widget.user.email ?? "",
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          Expanded(child: SizedBox()),
          SecondaryButtonWidget(
            onPressed: () {
              AutoRouter.of(
                context,
              ).push(ChangePasswordViewRoute(userModel: widget.user));
            },
            text: t.changePassword,
            padding: EdgeInsets.zero,
          ),
          PrimaryButtonWidget(
            padding: EdgeInsets.only(bottom: 16),
            onPressed: () async {
              await getSdk.logout(context);
            },
            text: t.logout,
          ),
        ],
      ),
    );
  }
}
