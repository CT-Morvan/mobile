import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/gen/assets.gen.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "FirstLoginViewRoute")
class FirstLoginView extends StatefulWidget {
  const FirstLoginView({super.key});
  @override
  State<FirstLoginView> createState() => _FirstLoginViewState();
}

class _FirstLoginViewState extends State<FirstLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.logo.image(),
            Text(
              t.welcomeTitle(name: "Lucas"),
              style: TextStyle(fontSize: 24, color: textColor),
            ), //todo: nome do usuário
            Text(
              t.welcomeDescription,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ), //todo: encontrar uma cor um pouco mais clara
            ),
            PrimaryButtonWidget(
              onPressed: () {
                AutoRouter.of(context).push(ChangePasswordViewRoute());
              },
              text: t.kContinue,
            ),
          ],
        ),
      ),
    );
  }
}
