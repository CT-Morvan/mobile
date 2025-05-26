import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class BioimpedanceListApi
    extends Api<Map<String, dynamic>, List<BioimpedanceModel>> {
  final int userId;
  BioimpedanceListApi({required this.userId});

  @override
  List<BioimpedanceModel> getResponseApi(Map<String, dynamic> data) {
    List<BioimpedanceModel> tests = [];

    if (data.containsKey("data")) {
      for (var element in data["data"]) {
        final bioimpedanceModel = BioimpedanceModel.fromJson(element);
        tests.add(bioimpedanceModel);
      }
    }

    return tests;
  }

  @override
  String getUrl() {
    return "$userId/bioimpedances";
  }
}
