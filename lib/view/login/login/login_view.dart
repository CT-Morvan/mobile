import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_assets.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/login/login/bloc/login_bloc.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "LoginViewRoute")
class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _bloc = LoginBloc();

  @override
  void initState() {
    emailController.text = "test@example.com";
    passwordController.text = "password";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_outlined)),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            AutoRouter.of(context).push(NavigationMenuViewRoute());
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          return SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            reverse: true,
            child: Padding(
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
                      _bloc.add(
                        LoginEvent(
                          user: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    text: t.access,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
