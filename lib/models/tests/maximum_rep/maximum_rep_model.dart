import 'package:json_annotation/json_annotation.dart';

part 'maximum_rep_model.g.dart';

@JsonSerializable()
class MaximumRepModel {
  final DateTime date;
  @JsonKey(name: "one_rep_max")
  final double oneRepMax;

  const MaximumRepModel({required this.date, required this.oneRepMax});

  factory MaximumRepModel.fromJson(Map<String, dynamic> json) =>
      _$MaximumRepModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaximumRepModelToJson(this);
}
