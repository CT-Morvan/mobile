import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const BottomSheetItemWidget({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(text, style: TextStyle(color: textColor, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
