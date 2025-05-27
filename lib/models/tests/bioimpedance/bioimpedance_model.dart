import 'package:json_annotation/json_annotation.dart';

part 'bioimpedance_model.g.dart';

@JsonSerializable()
class BioimpedanceModel {
  @JsonKey(name: "exam_date")
  final DateTime? date;
  final double? height;
  final double? weight;
  final double? imc;
  @JsonKey(name: "fat_percentage")
  final double? fatPercentage;
  @JsonKey(name: "muscle_percentage")
  final double? musclePercentage;
  @JsonKey(name: "basal_metabolism")
  final double? basalMetabolism;
  @JsonKey(name: "metabolic_age")
  final double? metabolicAge;
  @JsonKey(name: "visceral_fat")
  final double? visceralFat;

  BioimpedanceModel({
    required this.date,
    required this.height,
    required this.weight,
    required this.imc,
    required this.fatPercentage,
    required this.musclePercentage,
    required this.basalMetabolism,
    required this.metabolicAge,
    required this.visceralFat,
  });

  factory BioimpedanceModel.fromJson(Map<String, dynamic> json) =>
      _$BioimpedanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BioimpedanceModelToJson(this);
}
