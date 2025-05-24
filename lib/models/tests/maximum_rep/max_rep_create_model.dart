import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'max_rep_create_model.g.dart';

@JsonSerializable()
class MaxRepCreateModel {
  @JsonKey(name: "exercise_id")
  final int? exerciseId;
  @JsonKey(name: "max_reps")
  final int? maxReps;
  final double? workload;
  final DateTime? date;


  MaxRepCreateModel({
    required this.exerciseId,
    required this.maxReps,
    required this.workload,
    required this.date,
  });

  factory MaxRepCreateModel.fromJson(Map<String, dynamic> json) =>
      _$MaxRepCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaxRepCreateModelToJson(this);
}
