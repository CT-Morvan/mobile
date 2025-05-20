import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_model.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_result_model.dart';
import 'package:ct_morvan_app/view/tests/maximum_rep/widget/maximum_rep_chart_widget.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "MaximumRepResultsViewRoute")
class MaximumRepResultsView extends StatefulWidget {
  const MaximumRepResultsView({super.key});

  @override
  State<MaximumRepResultsView> createState() => _MaximumRepResultsViewState();
}

class _MaximumRepResultsViewState extends State<MaximumRepResultsView> {
  final List<MaximumRepResultModel> results = [
    MaximumRepResultModel(
      exerciseName: "Rosca concentrada",
      exerciseId: 1,
      results: [
        MaximumRepModel(date: DateTime(2017, 9, 19), oneRepMax: 15),
        MaximumRepModel(date: DateTime(2018, 5, 12), oneRepMax: 20),
        MaximumRepModel(date: DateTime(2019, 10, 2), oneRepMax: 25),
      ],
    ),
    MaximumRepResultModel(
      exerciseName: "Elevação lateral",
      exerciseId: 1,
      results: [
        MaximumRepModel(date: DateTime(2017, 9, 19), oneRepMax: 5),
        MaximumRepModel(date: DateTime(2018, 5, 12), oneRepMax: 8),
        MaximumRepModel(date: DateTime(2019, 10, 2), oneRepMax: 9),
      ],
    ),
    MaximumRepResultModel(
      exerciseName: "Levantamento terra",
      exerciseId: 1,
      results: [
        MaximumRepModel(date: DateTime(2017, 9, 19), oneRepMax: 0),
        MaximumRepModel(date: DateTime(2018, 5, 12), oneRepMax: 15),
        MaximumRepModel(date: DateTime(2019, 10, 2), oneRepMax: 25),
      ],
    ),
    MaximumRepResultModel(
      exerciseName: "teste",
      exerciseId: 1,
      results: [MaximumRepModel(date: DateTime(2019, 10, 2), oneRepMax: 25)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.maximumRepTest)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return MaximumRepChartWidget(
              title: results[index].exerciseName ?? "",
              series: results[index].results ?? [],
            );
          },
          itemCount: results.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
