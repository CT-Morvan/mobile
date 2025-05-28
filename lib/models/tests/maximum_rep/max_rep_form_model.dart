import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_exercise_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'max_rep_form_model.g.dart';

@JsonSerializable()
class MaxRepFormModel {
  final List<MaxRepExerciseModel>? data;

  const MaxRepFormModel({required this.data});

  factory MaxRepFormModel.fromJson(Map<String, dynamic> json) =>
      _$MaxRepFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaxRepFormModelToJson(this);
}
