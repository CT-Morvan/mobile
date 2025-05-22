import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/gen/assets.gen.dart';
import 'package:ct_morvan_app/widget/primary_button_widget.dart';
import 'package:flutter/material.dart';

class FullscreenMessageWidget extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String buttonText;
  final void Function() buttonAction;

  const FullscreenMessageWidget({
    required this.title,
    required this.buttonText,
    required this.buttonAction,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          icon ??
              Assets.svg.listEmpty.svg(
                height: 128,
                width: 128,
                colorFilter: ColorFilter.mode(grayColor, BlendMode.srcATop),
              ),
          Text(title, style: TextStyle(color: textColor, fontSize: 18)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PrimaryButtonWidget(
              onPressed: () {
                buttonAction();
              },
              text: buttonText,
              padding: EdgeInsets.zero,
              expanded: false,
            ),
          ),
        ],
      ),
    );
  }
}
