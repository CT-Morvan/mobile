import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final UserTypeEnum? type;
  final String? token;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.type,
    this.token,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
