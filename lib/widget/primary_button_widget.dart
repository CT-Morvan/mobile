import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final String text;
  final void Function() onPressed;
  final bool enabled;
  final bool expanded;

  const PrimaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.backgroundColor = primaryColor,
    this.enabled = true,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (expanded) ...[
            Expanded(child: _getButton()),
          ] else ...[
            _getButton(),
          ],
        ],
      ),
    );
  }

  Widget _getButton() {
    return ElevatedButton(
      onPressed:
          enabled
              ? () {
                onPressed();
              }
              : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: TextStyle(color: whiteColor)),
    );
  }
}
