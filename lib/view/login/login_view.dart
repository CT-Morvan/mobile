import 'package:auto_route/annotations.dart';
import 'package:ct_morvan_app/consts/app_assets.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/login/first_login_view.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "LoginViewRoute")
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(ctMorvanLogo),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppTextFieldWidget(
                controller: emailController,
                hint: t.emailHint,
                label: t.email,
                maxLines: 1,
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: AppTextFieldWidget(
                controller: passwordController,
                label: t.password,
                maxLines: 1,
                obscureText: true,
                prefixIcon: Icon(Icons.password),
              ),
            ),
            PrimaryButtonWidget(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FirstLoginView()),
                );
              },
              text: t.access,
            ),
          ],
        ),
      ),
    );
  }
}
