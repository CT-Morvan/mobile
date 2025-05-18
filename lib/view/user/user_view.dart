import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:ct_morvan_app/widget/secondary_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "UserViewRoute")
class UserView extends StatefulWidget {
  const UserView({super.key});
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
              child: ClipOval(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: "https://picsum.photos/200",
                    placeholder:
                        (context, url) => Center(
                          child: SizedBox(
                            height: 48,
                            width: 48,
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Lucas Sabino",
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
          Text(
            "lucas.sabino",
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          Expanded(child: SizedBox()),
          PrimaryButtonWidget(
            onPressed: () {
              AutoRouter.of(context).push(ChangePasswordViewRoute());
            },
            text: t.changePassword,
            padding: EdgeInsets.zero,
          ),
          SecondaryButtonWidget(
            padding: EdgeInsets.only(bottom: 16),
            onPressed: () async {
              // await getSdk.logout(context);
            },
            text: t.logout,
          ),
        ],
      ),
    );
  }
}
