import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/models/tests/maximum_rep/maximum_rep_model.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

class MaximumRepChartWidget extends StatelessWidget {
  final String title;
  final List<MaximumRepModel> series;

  const MaximumRepChartWidget({
    super.key,
    required this.title,
    required this.series,
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
                  accessor: (MaximumRepModel datum) => datum.date,
                  scale: TimeScale(
                    formatter: (time) => DateFormat('MM-dd').format(time),
                  ),
                ),
                t.maximumRep: Variable(
                  accessor: (MaximumRepModel datum) => datum.oneRepMax,
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
              coord: RectCoord(color: const Color(0xffdddddd)),
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
