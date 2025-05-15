import 'package:json_annotation/json_annotation.dart';

part 'excercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final String? name;
  final int? id;

  const ExerciseModel({required this.name, required this.id});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}
