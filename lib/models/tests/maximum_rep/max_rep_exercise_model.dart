import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_create_model.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'max_rep_exercise_model.g.dart';

@JsonSerializable()
class MaxRepExerciseModel {
  final String? name;
  final int? id;
  @JsonKey(defaultValue: 0)
  int maxRep;
  @JsonKey(defaultValue: 0)
  double workload;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController maxRepController = TextEditingController();
  @JsonKey(includeFromJson: false, includeToJson: false)
  final TextEditingController workloadController = TextEditingController();

  MaxRepExerciseModel({
    required this.name,
    required this.id,
    required this.maxRep,
    required this.workload,
  });

  factory MaxRepExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$MaxRepExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaxRepExerciseModelToJson(this);

  MaxRepCreateModel toMaxRepCreateModel(DateTime date) {
    return MaxRepCreateModel(
      workload: workload,
      exerciseId: id,
      maxReps: maxRep,
      date: date,
    );
  }
}
