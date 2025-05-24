import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_create_model.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/max_rep_form_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class MaxRepFormStoreApi extends Api<Map<String, dynamic>, MaxRepFormModel> {
  final int? userId;
  final List<MaxRepCreateModel> maximums;

  MaxRepFormStoreApi({required this.userId, required this.maximums});

  @override
  MaxRepFormModel getResponseApi(Map<String, dynamic> data) {
    final loginModel = MaxRepFormModel.fromJson(data);

    return loginModel;
  }

  @override
  String getUrl() {
    return "$userId/exercise-maximums/batch";
  }

  @override
  Object? getBody() {
    return {"user_id": userId, "maximums": maximums};
  }
}
