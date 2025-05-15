import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maximum_rep_result_model.g.dart';

@JsonSerializable()
class MaximumRepResultModel {
  final String? exerciseName;
  final int? exerciseId;
  final List<MaximumRepModel>? results;

  const MaximumRepResultModel({
    required this.exerciseName,
    required this.exerciseId,
    required this.results,
  });
  
  factory MaximumRepResultModel.fromJson(Map<String, dynamic> json) =>
      _$MaximumRepResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaximumRepResultModelToJson(this);
}
