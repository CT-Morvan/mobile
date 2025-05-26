import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

@RoutePage(name: "BioimpedanceResultViewRoute")
class BioimpedanceResultView extends StatefulWidget {
  const BioimpedanceResultView({Key? key}) : super(key: key);

  @override
  _BioimpedanceResultViewState createState() => _BioimpedanceResultViewState();
}

class _BioimpedanceResultViewState extends State<BioimpedanceResultView> {
  final List<BioimpedanceModel> list = [
    BioimpedanceModel(
      date: DateTime(2019, 3, 29),
      height: 173,
      weight: 70,
      imc: 26,
      fatPercentage: 20,
      musclePercentage: 20,
      basalMetabolism: 1800,
      metabolicAge: 40,
      visceralFat: 6,
    ),
    BioimpedanceModel(
      date: DateTime(2022, 3, 29),
      height: 173,
      weight: 80,
      imc: 30,
      fatPercentage: 20,
      musclePercentage: 15,
      basalMetabolism: 2000,
      metabolicAge: 49,
      visceralFat: 8,
    ),
    BioimpedanceModel(
      date: DateTime.now(),
      height: 173,
      weight: 74,
      imc: 26,
      fatPercentage: 26,
      musclePercentage: 30,
      basalMetabolism: 1500,
      metabolicAge: 29,
      visceralFat: 6,
    ),
  ];
  final lineMarkerData = [
    {'day': 'Mon', 'value': 10, 'group': 'Highest'},
    {'day': 'Tue', 'value': 11, 'group': 'Highest'},
    {'day': 'Wed', 'value': 13, 'group': 'Highest'},
    {'day': 'Thu', 'value': 11, 'group': 'Highest'},
    {'day': 'Fri', 'value': 12, 'group': 'Highest'},
    {'day': 'Sat', 'value': 12, 'group': 'Highest'},
    {'day': 'Sun', 'value': 9, 'group': 'Highest'},

    {'day': 'Mon', 'value': 1, 'group': 'Lowest'},
    {'day': 'Tue', 'value': -2, 'group': 'Lowest'},
    {'day': 'Wed', 'value': 2, 'group': 'Lowest'},
    {'day': 'Thu', 'value': 5, 'group': 'Lowest'},
    {'day': 'Fri', 'value': 3, 'group': 'Lowest'},
    {'day': 'Sat', 'value': 2, 'group': 'Lowest'},
    {'day': 'Sun', 'value': 0, 'group': 'Lowest'},

    {'day': 'Mon', 'value': 2, 'group': 'Midwest'},
    {'day': 'Tue', 'value': 3, 'group': 'Midwest'},
    {'day': 'Wed', 'value': 5, 'group': 'Midwest'},
    {'day': 'Thu', 'value': 2, 'group': 'Midwest'},
    {'day': 'Fri', 'value': 1, 'group': 'Midwest'},
    {'day': 'Sat', 'value': 4, 'group': 'Midwest'},
    {'day': 'Sun', 'value': 7, 'group': 'Midwest'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.maximumRepTest)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: lineMarkerData,
                  variables: {
                    'day': Variable(
                      accessor: (Map datum) => datum['day'] as String,
                      scale: OrdinalScale(inflate: true),
                    ),
                    'value': Variable(
                      accessor: (Map datum) => datum['value'] as num,
                      scale: LinearScale(
                        max: 15,
                        min: -3,
                        tickCount: 7,
                        formatter: (v) => '${v.toInt()} ℃',
                      ),
                    ),
                    'group': Variable(
                      accessor: (Map datum) => datum['group'] as String,
                    ),
                  },
                  coord: RectCoord(horizontalRange: [0.01, 0.99]),
                  marks: [
                    LineMark(
                      position:
                          Varset('day') * Varset('value') / Varset('group'),
                      size: SizeEncode(value: 1),
                      color: ColorEncode(
                        variable: 'group',
                        values: [
                          const Color(0xff5470c6),
                          const Color(0xff91cc75),
                          const Color.fromARGB(255, 225, 243, 66),
                        ],
                      ),
                      selected: {
                        'touchMove': {1},
                      },
                    ),
                    PointMark(
                      color: ColorEncode(
                        variable: 'group',
                        values: [
                          const Color(0xff5470c6),
                          const Color(0xff91cc75),
                          const Color.fromARGB(255, 225, 243, 66),
                        ],
                        updaters: {
                          'groupMouse': {
                            false: (color) => color.withAlpha(100),
                          },
                          'groupTouch': {
                            false: (color) => color.withAlpha(100),
                          },
                        },
                      ),
                    ),
                  ],
                  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
                  selections: {
                    'touchMove': PointSelection(
                      variable: 'day',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
