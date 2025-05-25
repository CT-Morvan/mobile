import 'package:ct_morvan_app/models/tests/maximum_rep/maximum_rep_result_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class MaxRepResultApi
    extends Api<Map<String, dynamic>, List<MaximumRepResultModel>> {
  final int? userId;

  MaxRepResultApi({required this.userId});

  @override
  List<MaximumRepResultModel> getResponseApi(Map<String, dynamic> data) {
    List<MaximumRepResultModel> list = [];

    if (data.containsKey("data")) {
      for (var element in data["data"]) {
        final loginModel = MaximumRepResultModel.fromJson(element);
        list.add(loginModel);
      }
    }

    return list;
  }

  @override
  String getUrl() {
    return "$userId/exercise-maximums/list";
  }
}
