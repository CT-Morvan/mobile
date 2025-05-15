import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_assets.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/main/navigation_menu_view.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "ChangePasswordViewRoute")
class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool hasErrorPassword = false;
  bool hasErrorConfirmPassword = false;

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      final regexPassword = RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
      );

      setState(() {
        hasErrorPassword = !regexPassword.hasMatch(passwordController.text);
      });
    });

    confirmPasswordController.addListener(() {
      setState(() {
        hasErrorConfirmPassword =
            confirmPasswordController.text != passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ctMorvanLogo),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AppTextFieldWidget(
                  controller: passwordController,
                  label: t.password,
                  maxLines: 1,
                  obscureText: true,
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              Visibility(
                visible: hasErrorPassword,
                child: Text(
                  t.passwordRequirements,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AppTextFieldWidget(
                  controller: confirmPasswordController,
                  label: t.confirmPassword,
                  maxLines: 1,
                  obscureText: true,
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              Visibility(
                visible: hasErrorConfirmPassword,
                child: Text(
                  t.passwordAreNotTheSame,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
              PrimaryButtonWidget(
                enabled:
                    passwordController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    !hasErrorPassword &&
                    !hasErrorConfirmPassword,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NavigationMenuView(),
                    ),
                  );
                },
                text: t.kContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
