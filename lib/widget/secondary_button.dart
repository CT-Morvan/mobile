import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final String text;
  final void Function() onPressed;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.borderColor = primaryColor,
    this.textColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                onPressed();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(),

                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(width: 2, color: borderColor),
              ),
              child: Text(text, style: TextStyle(color: textColor)),
            ),
          ),
        ],
      ),
    );
  }
}
