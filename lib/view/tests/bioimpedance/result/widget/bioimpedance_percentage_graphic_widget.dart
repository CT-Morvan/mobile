import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_graphic_model.dart';
import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

class BioimpedancePercentageGraphicWidget extends StatelessWidget {
  final List<BioimpedanceModel> list;
  const BioimpedancePercentageGraphicWidget({required this.list, super.key});

  List<BioimpedanceGraphicModel> convertList(List<BioimpedanceModel> list) {
    final List<BioimpedanceGraphicModel> temp = [];

    for (final item in list) {
      if (item.date == null) continue;

      if (item.fatPercentage != null) {
        temp.add(
          BioimpedanceGraphicModel(
            day: item.date!,
            value: item.fatPercentage!,
            group: BioimpedanceGroup.fat.getName(),
          ),
        );
      }

      if (item.musclePercentage != null) {
        temp.add(
          BioimpedanceGraphicModel(
            day: item.date!,
            value: item.musclePercentage!,
            group: BioimpedanceGroup.muscle.getName(),
          ),
        );
      }
    }

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),

      height: 300,
      child: Chart(
        data: convertList(list),
        variables: {
          t.date: Variable(
            accessor: (BioimpedanceGraphicModel datum) => datum.day,
            scale: TimeScale(
              formatter: (time) => DateFormat('dd/MM').format(time),
            ),
          ),
          'value': Variable(
            accessor: (BioimpedanceGraphicModel datum) => datum.value,
            scale: LinearScale(formatter: (v) => '${v.toInt()} %'),
          ),
          'group': Variable(
            accessor: (BioimpedanceGraphicModel datum) => datum.group,
          ),
        },
        coord: RectCoord(
          horizontalRange: [0.01, 0.99],
          color: graphicBackgroundColor,
        ),
        marks: [
          LineMark(
            position: Varset(t.date) * Varset('value') / Varset('group'),
            size: SizeEncode(value: 1),
            color: ColorEncode(
              variable: 'group',
              values: [primaryColor, greenColor],
            ),
            selected: {
              'touchMove': {1},
            },
          ),
          PointMark(
            color: ColorEncode(
              variable: 'group',
              values: [primaryColor, greenColor],
              updaters: {
                'groupMouse': {false: (color) => color.withAlpha(100)},
                'groupTouch': {false: (color) => color.withAlpha(100)},
              },
            ),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
        selections: {
          'touchMove': PointSelection(
            variable: t.date,
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
          variables: ['group', 'value'],
          offset: const Offset(-20, -20),
        ),
        crosshair: CrosshairGuide(followPointer: [false, true]),
        annotations: [
          LineAnnotation(
            dim: Dim.y,
            value: 11.14,
            style: PaintStyle(
              strokeColor: const Color(0xff5470c6).withAlpha(100),
              dash: [2],
            ),
          ),
          LineAnnotation(
            dim: Dim.y,
            value: 1.57,
            style: PaintStyle(
              strokeColor: const Color(0xff91cc75).withAlpha(100),
              dash: [2],
            ),
          ),
        ],
      ),
    );
  }
}
