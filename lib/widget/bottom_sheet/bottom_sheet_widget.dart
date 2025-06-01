import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/widget/bottom_sheet/bottom_sheet_item_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final List<BottomSheetItemWidget> itens;

  const BottomSheetWidget({
    required this.title,
    required this.itens,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...itens,
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
