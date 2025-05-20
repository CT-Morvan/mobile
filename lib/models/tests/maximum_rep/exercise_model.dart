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
