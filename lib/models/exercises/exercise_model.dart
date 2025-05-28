import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final String? name;
  @JsonKey(name: "video_url")
  final String? videoUrl;
  @JsonKey(name: "image_url")
  final String? imageUrl;

  ExerciseModel({required this.name, this.imageUrl, this.videoUrl});
  
  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);
}