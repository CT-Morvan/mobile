import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;

  const BottomSheetItemWidget({
    required this.text,
    required this.onTap,
    required this.icon,
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
            Icon(icon, color: steelColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
