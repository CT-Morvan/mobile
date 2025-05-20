import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  final String label;
  final String? hint;
  final String? suffixText;
  final bool obscureText;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.maxLines,
    this.obscureText = false,
    this.prefixIcon,
    this.onChanged,
    this.suffixText,
    this.textInputType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(color: steelColor),
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        
      ),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      keyboardType: textInputType,
      cursorColor: primaryColor,
      obscureText: obscureText,
    );
  }
}
