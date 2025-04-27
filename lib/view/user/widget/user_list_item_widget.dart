import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/view/models/user.dart';
import 'package:flutter/material.dart';

class UserListItemWidget extends StatelessWidget {
  final User user;
  const UserListItemWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipOval(
                  child: SizedBox(
                    height: 52,
                    width: 52,
                    child: CachedNetworkImage(
                      imageUrl: user.pictureUrl ?? "",
                      placeholder:
                          (context, url) => Center(
                            child: SizedBox(
                              height: 32,
                              width: 32,
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  user.name ?? "",
                  style: TextStyle(fontSize: 16, color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
