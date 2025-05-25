import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maximum_rep_result_model.g.dart';

@JsonSerializable()
class MaximumRepResultModel {
  final String? name;
  final int? id;
  final List<MaximumRepModel>? maximums;

  const MaximumRepResultModel({
    required this.name,
    required this.id,
    required this.maximums,
  });

  factory MaximumRepResultModel.fromJson(Map<String, dynamic> json) =>
      _$MaximumRepResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaximumRepResultModelToJson(this);
}
