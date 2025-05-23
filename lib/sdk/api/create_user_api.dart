import 'package:ct_morvan_app/models/enum/user_type_enum.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class CreateUserApi extends Api<Map<String, dynamic>, UserModel> {
  final String userName;
  final String email;
  final String password;
  final UserTypeEnum type;

  CreateUserApi({
    required this.userName,
    required this.email,
    required this.password,
    required this.type,
  });

  @override
  UserModel getResponseApi(Map<String, dynamic> data) {
    return UserModel.fromJson(data);
  }

  @override
  String getUrl() {
    return "users";
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Object? getBody() {
    return {
      "name": userName,
      "email": email,
      "password": password,
      "type": type.name,
    };
  }
}
