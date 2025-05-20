import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
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

  ExerciseModel({
    required this.name,
    required this.id,
    required this.maxRep,
    required this.workload,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}
