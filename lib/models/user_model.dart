import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? pictureUrl;
  final String? userName;
  final String? password;
  final bool? isAdmin;

  UserModel({
    this.id,
    this.name,
    this.pictureUrl,
    this.userName,
    this.password,
    this.isAdmin = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
