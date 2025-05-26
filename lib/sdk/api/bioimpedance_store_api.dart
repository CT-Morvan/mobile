import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class BioimpedanceStoreApi
    extends Api<Map<String, dynamic>, BioimpedanceModel> {
  final int? userId;
  final BioimpedanceModel bioimpedanceModel;

  BioimpedanceStoreApi({required this.userId, required this.bioimpedanceModel});

  @override
  BioimpedanceModel getResponseApi(Map<String, dynamic> data) {
    return BioimpedanceModel.fromJson(data);
  }

  @override
  String getUrl() {
    return "$userId/bioimpedances";
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }

  @override
  Object? getBody() {
    return bioimpedanceModel;
  }
}
