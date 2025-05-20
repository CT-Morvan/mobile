import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/widget/user_image_widget.dart';
import 'package:flutter/material.dart';

class UserListItemWidget extends StatelessWidget {
  final UserModel user;
  const UserListItemWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Wrap(
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
                            t.storeTests,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            AutoRouter.of(
                              context,
                            ).push(MaximumRepFormViewRoute());
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  t.maximumRepTest,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();

                            //todo: alterar rota pra receber user id

                            AutoRouter.of(
                              context,
                            ).push(MaximumRepFormViewRoute());
                          },
                          borderRadius: BorderRadius.circular(4),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  t.bioimpedance,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: UserImageWidget(size: 54, borderWidth: 2),
              ),
              Expanded(
                child: Text(
                  user.name ?? "",
                  style: TextStyle(fontSize: 16, color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              //todo: comentado visto não sabermos se será desenvolvido a deleção e edição de usuários
              // IconButton(
              //   onPressed: () {
              //     showModalBottomSheet<void>(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return SizedBox(
              //           height: 200,
              //           child: Center(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               mainAxisSize: MainAxisSize.min,
              //               children: <Widget>[
              //                 const Text('Modal BottomSheet'),
              //                 ElevatedButton(
              //                   child: const Text('Close BottomSheet'),
              //                   onPressed: () => Navigator.pop(context),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   icon: Icon(Icons.more_vert),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
