import 'package:ct_morvan_app/consts/app_assets.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/widget/primary_button.dart';
import 'package:ct_morvan_app/widget/secondary_button.dart';
import 'package:flutter/material.dart';

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
                child: Image.asset(
                  ctMorvanLogo, //todo foto do usuario
                  height: 200,
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
          PrimaryButton(
            onPressed: () {},
            text: "Trocar Senha",
            padding: EdgeInsets.zero,
          ),
          SecondaryButton(
            padding: EdgeInsets.only(bottom: 16),
            onPressed: () {},
            text: "Logout",
          ),
        ],
      ),
    );
  }
}
