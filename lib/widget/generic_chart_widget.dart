import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

class GenericChartWidget extends StatelessWidget {
  final String title;
  final String label;
  final String unit;
  final List<GenericChartModel> series;

  const GenericChartWidget({
    required this.title,
    required this.series,
    required this.label,
    this.unit = "",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 300,
            child: Chart(
              data: series,
              variables: {
                t.date: Variable(
                  accessor: (GenericChartModel datum) => datum.date,
                  scale: TimeScale(
                    formatter: (time) => DateFormat('dd/MM').format(time),
                  ),
                ),
                label: Variable(
                  accessor: (GenericChartModel datum) => datum.value,
                  scale: LinearScale(formatter: (v) => '$v $unit'),
                ),
              },
              marks: [
                LineMark(
                  shape: ShapeEncode(value: BasicLineShape()),
                  color: ColorEncode(value: primaryColor),
                  selected: {
                    'touchMove': {series.length - 1},
                  },
                ),
              ],
              coord: RectCoord(color: graphicBackgroundColor),
              axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
              selections: {
                'touchMove': PointSelection(
                  on: {
                    GestureType.scaleUpdate,
                    GestureType.tapDown,
                    GestureType.longPressMoveUpdate,
                  },
                  dim: Dim.x,
                ),
              },
              tooltip: TooltipGuide(
                followPointer: [false, true],
                align: Alignment.topLeft,
                offset: const Offset(-20, -20),
              ),
              crosshair: CrosshairGuide(followPointer: [false, true]),
            ),
          ),
        ],
      ),
    );
  }
}

class GenericChartModel {
  final DateTime date;
  final double value;

  const GenericChartModel({required this.date, required this.value});
}
