import 'package:ct_morvan_app/models/tests/maximum_rep/exercise_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'max_rep_form_model.g.dart';

@JsonSerializable()
class MaxRepFormModel {
  final List<ExerciseModel>? data;

  const MaxRepFormModel({required this.data});

  factory MaxRepFormModel.fromJson(Map<String, dynamic> json) =>
      _$MaxRepFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaxRepFormModelToJson(this);
}
