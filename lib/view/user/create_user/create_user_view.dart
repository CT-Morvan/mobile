import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/extensions/string_extension.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/user/create_user/bloc/create_user_bloc.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "CreateUserViewRoute")
class CreateUserView extends StatefulWidget {
  const CreateUserView({super.key});

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  final _formKey = GlobalKey<FormState>();
  final CreateUserBloc _bloc = CreateUserBloc();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isAdmin = false;
  bool isLoading = false;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.createUser, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<CreateUserBloc, CreateUserState>(
        listener: (context, state) {
          if (state is CreateUserStateSuccess) {
            AutoRouter.of(context).pop();
          }

          if (state is CreateUserStateError) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is CreateUserStateLoading) {
            setState(() {
              isLoading = true;
            });
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          if (state is CreateUserStateLoading) {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AppTextFieldWidget(
                      controller: userNameController,
                      hint: t.nameHint,
                      label: t.name,
                      maxLines: 1,
                      prefixIcon: Icon(Icons.person_rounded),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AppTextFieldWidget(
                      controller: emailController,
                      hint: t.emailHint,
                      label: t.email,
                      maxLines: 1,
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.requiredField;
                        }
                        if (!value.checkIfIsValidEmail()) {
                          return t.invalidEmail;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AppTextFieldWidget(
                      controller: passwordController,
                      hint: t.password,
                      label: t.password,
                      maxLines: 1,
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
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            t.adminUser,
                            style: TextStyle(fontSize: 16, color: textColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Switch(
                          value: isAdmin,
                          activeColor: primaryColor,
                          onChanged: (bool value) {
                            setState(() {
                              isAdmin = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isLoading ? grayColor.withAlpha(90) : primaryColor,
        onPressed:
            isLoading
                ? null
                : () {
                  if (_formKey.currentState!.validate()) {
                    _bloc.add(
                      CreateUserEvent(
                        userName: userNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        isAdmin: isAdmin,
                      ),
                    );
                  }
                },
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
