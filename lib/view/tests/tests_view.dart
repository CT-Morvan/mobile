import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "TestsViewRoute")
class TestsView extends StatefulWidget {
  const TestsView({super.key});
  @override
  State<TestsView> createState() => _TestsViewState();
}

class _TestsViewState extends State<TestsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  AutoRouter.of(context).push(MaximumRepFormViewRoute());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Teste de repetição maxima",
                          style: TextStyle(fontSize: 16, color: textColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
