import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:flutter/material.dart';

class CreateUserView extends StatefulWidget {
  const CreateUserView({super.key});

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isAdmin = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppTextFieldWidget(
                controller: nameController,
                hint: t.nameHint,
                label: t.name,
                maxLines: 1,
                prefixIcon: Icon(Icons.person_2_outlined),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
