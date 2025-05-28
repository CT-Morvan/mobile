import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';

class DialogCreateExercise extends StatefulWidget {
  final void Function(String) createFunction;

  const DialogCreateExercise({required this.createFunction, super.key});

  @override
  State<DialogCreateExercise> createState() => _DialogCreateExerciseState();
}

class _DialogCreateExerciseState extends State<DialogCreateExercise> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t.createExercise,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: textColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AppTextFieldWidget(
                  controller: nameController,
                  hint: t.exercise(n: 1),
                  label: t.exercise(n: 1),
                  maxLines: 1,
                  prefixIcon: Icon(Icons.fitness_center),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.requiredField;
                    }
                    return null;
                  },
                ),
              ),
              Row(
                spacing: 16,
                children: [
                  Flexible(
                    child: PrimaryButtonWidget(
                      padding: EdgeInsetsGeometry.only(top: 8),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          widget.createFunction(nameController.text);
                        }
                      },
                      text: t.save,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
