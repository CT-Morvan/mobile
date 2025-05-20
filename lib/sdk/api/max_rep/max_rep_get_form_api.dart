import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_form_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class MaxRepGetFormApi extends Api<Map<String, dynamic>, MaxRepFormModel> {
  MaxRepGetFormApi();

  @override
  MaxRepFormModel getResponseApi(Map<String, dynamic> data) {
    final loginModel = MaxRepFormModel.fromJson(data);

    return loginModel;
  }

  @override
  String getUrl() {
    return "exercises";
  }

  @override
  bool get isAuth => false;
}
