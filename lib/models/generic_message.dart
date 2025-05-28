
import 'package:json_annotation/json_annotation.dart';

part 'generic_message.g.dart';

@JsonSerializable()
class GenericMessage {
  final String message;

  GenericMessage({required this.message});

  factory GenericMessage.fromJson(Map<String, dynamic> json) =>
      _$GenericMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GenericMessageToJson(this);
}