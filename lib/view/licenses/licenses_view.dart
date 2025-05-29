import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/consts/licenses.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "LicensesViewRoute")
class LicensesView extends StatelessWidget {
  const LicensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.openSourceLicenses)),
      body: ListView.separated(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        separatorBuilder: (context, index) => Divider(),
        itemCount: licenses.length,
        itemBuilder: (context, index) {
          final license = licenses[index];
          return ListTile(
            title: Text(license['name']!),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: backgroundColor,
                    title: Text(t.license(name: license['name'] ?? "")),
                    content: SingleChildScrollView(
                      child: Text(license['license']!),
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Fechar',
                          style: TextStyle(color: primaryColor),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
