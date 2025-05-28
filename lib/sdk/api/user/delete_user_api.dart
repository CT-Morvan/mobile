import 'package:ct_morvan_app/models/generic_message.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class DeleteUserApi extends Api<Map<String, dynamic>, GenericMessage> {
  final int? userId;
  DeleteUserApi({required this.userId});

  @override
  GenericMessage getResponseApi(Map<String, dynamic> data) {
    return GenericMessage.fromJson(data);
  }

  @override
  String getUrl() {
    return "users/$userId";
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.delete;
  }
}
