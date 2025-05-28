import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:flutter/material.dart';

class GenericLoadingDialog extends StatelessWidget {
  final String? message;
  const GenericLoadingDialog({this.message, super.key});

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
            Text(
              message ?? t.pleaseWait,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
