import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final String text;
  final void Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.backgroundColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(text, style: TextStyle(color: whiteColor)),
            ),
          ),
        ],
      ),
    );
  }
}
