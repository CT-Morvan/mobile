import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class EditUserApi extends Api<Map<String, dynamic>, UserModel> {
  final UserModel user;

  EditUserApi({required this.user});

  @override
  UserModel getResponseApi(Map<String, dynamic> data) {
    if (data.containsKey("data")) {
      return UserModel.fromJson(data["data"]);
    }
    return user;
  }

  @override
  String getUrl() {
    return "users/${user.id}";
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.put;
  }

  @override
  Object? getBody() {
    return {"name": user.name, "email": user.email, "password": user.password};
  }
}
