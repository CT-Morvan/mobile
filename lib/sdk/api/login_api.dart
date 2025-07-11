import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class LoginApi extends Api<Map<String, dynamic>, UserModel> {
  final String user;
  final String password;

  LoginApi({required this.user, required this.password});

  @override
  UserModel getResponseApi(Map<String, dynamic> data) {
    final loginModel = UserModel.fromJson(data);

    return loginModel;
  }

  @override
  Map<String, dynamic> getBody() {
    return {"email": user, "password": password};
  }

  @override
  String getUrl() {
    return "login";
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  bool get isAuth => false;
}
