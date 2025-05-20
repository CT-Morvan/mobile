import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class UserImageWidget extends StatelessWidget {
  final double size;
  final double borderWidth;

  const UserImageWidget({
    required this.size,
    required this.borderWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: size,
        width: size,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: borderWidth),
          ),
          child: Icon(Icons.person_rounded, size: size / 2),
        ),
        // CachedNetworkImage(
        //   imageUrl: "https://picsum.photos/200",
        //   placeholder:
        //       (context, url) => Center(
        //         child: SizedBox(
        //           height: 48,
        //           width: 48,
        //           child: CircularProgressIndicator(color: primaryColor),
        //         ),
        //       ),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        // ),
      ),
    );
  }
}
