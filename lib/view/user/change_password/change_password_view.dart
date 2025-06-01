import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/gen/assets.gen.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/user/edit/edit_user_bloc.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "ChangePasswordViewRoute")
class ChangePasswordView extends StatefulWidget {
  final UserModel userModel;

  const ChangePasswordView({required this.userModel, super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final EditUserBloc _bloc = EditUserBloc();

  bool isLoading = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.changePassword, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<EditUserBloc, EditUserState>(
        listener: (context, state) {
          if (state is EditUserSuccessState) {
            AutoRouter.of(context).pop();
          }

          if (state is EditUserErrorState) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is EditUserLoadingState) {
            setState(() {
              isLoading = true;
            });
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          return SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.images.logo.image(),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AppTextFieldWidget(
                        controller: passwordController,
                        label: t.password,
                        maxLines: 1,
                        obscureText: true,
                        prefixIcon: Icon(Icons.password),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.requiredField;
                          }
                          if (value.length < 8) {
                            return t.passwordRequirements;
                          }

                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.requiredField;
                          }
                          if (value.length < 8) {
                            return t.passwordRequirements;
                          }
                          if (value != passwordController.text) {
                            return t.passwordAreNotTheSame;
                          }
                          return null;
                        },
                      ),
                    ),
                    PrimaryButtonWidget(
                      backgroundColor:
                          isLoading ? grayColor.withAlpha(90) : primaryColor,
                      onPressed:
                          isLoading
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  final user = widget.userModel;
                                  user.password = passwordController.text;

                                  _bloc.add(EditUserEvent(user: user));
                                }
                              },
                      text: t.kContinue,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
