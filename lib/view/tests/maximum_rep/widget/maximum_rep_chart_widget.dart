import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_model.dart';
import 'package:ct_morvan_app/widget/generic_chart_widget.dart';
import 'package:flutter/material.dart';

class MaximumRepChartWidget extends StatelessWidget {
  final String title;
  final List<MaximumRepModel> series;

  const MaximumRepChartWidget({
    super.key,
    required this.title,
    required this.series,
  });

  List<GenericChartModel> convertSerie() {
    final List<GenericChartModel> list = [];

    for (final item in series) {
      list.add(GenericChartModel(date: item.date, value: item.oneRepMax));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GenericChartWidget(
      title: title,
      label: t.maximumRep,
      unit: t.kg,
      series: convertSerie(),
    );
  }
}
