import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:ct_morvan_app/widget/secondary_button_widget.dart';
import 'package:flutter/material.dart';

class GenericOptionDialog extends StatelessWidget {
  final String title;
  final String description;
  final void Function() primaryButtonFunction;
  final String primaryButtonText;
  final void Function()? secondaryButtonFunction;
  final String? secondaryButtonText;
  final Widget? icon;

  const GenericOptionDialog({
    required this.title,
    required this.description,
    required this.primaryButtonFunction,
    required this.primaryButtonText,
    this.secondaryButtonFunction,
    this.secondaryButtonText,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Padding(padding: const EdgeInsets.only(bottom: 8), child: icon),
            ],
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: textColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                description,
                style: TextStyle(color: steelColor, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Flexible(
                  child: PrimaryButtonWidget(
                    padding: EdgeInsetsGeometry.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                      primaryButtonFunction();
                    },
                    text: primaryButtonText,
                  ),
                ),
                Flexible(
                  child: SecondaryButtonWidget(
                    padding: EdgeInsetsGeometry.zero,
                    onPressed: () {
                      if (secondaryButtonFunction != null) {
                        secondaryButtonFunction!();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    text: secondaryButtonText ?? t.cancel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
