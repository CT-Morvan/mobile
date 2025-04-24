import 'package:ct_morvan_app/consts/app_assets.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/main/navigation_menu_view.dart';
import 'package:ct_morvan_app/widget/app_text_field.dart';
import 'package:ct_morvan_app/widget/primary_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(ctMorvanLogo),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppTextField(
                controller: emailController,
                hint: "email@gmail.com",
                label: t.email,
                maxLines: 1,
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AppTextField(
                controller: passwordController,
                label: "Senha",
                maxLines: 1,
                obscureText: true,
                prefixIcon: Icon(Icons.password),
              ),
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NavigationMenuView()),
                );
              },
              text: "Acessar",
            ),
          ],
        ),
      ),
    );
  }
}
