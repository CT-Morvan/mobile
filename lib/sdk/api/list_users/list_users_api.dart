import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class ListUsersApi extends Api<Map<String, dynamic>, List<UserModel>> {
  ListUsersApi();

  @override
  List<UserModel> getResponseApi(Map<String, dynamic> data) {
    List<UserModel> users = [];

    if (data.containsKey("data")) {
      for (var element in data["data"]) {
        final loginModel = UserModel.fromJson(element);
        users.add(loginModel);
      }
    }

    return users;
  }

  @override
  String getUrl() {
    return "users";
  }
}
