import 'package:ct_morvan_app/models/generic_message.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class DeleteExerciseApi extends Api<Map<String, dynamic>, GenericMessage> {
  final int? exerciseId;
  DeleteExerciseApi({required this.exerciseId});

  @override
  GenericMessage getResponseApi(Map<String, dynamic> data) {
    return GenericMessage.fromJson(data);
  }

  @override
  String getUrl() {
    return "exercises/$exerciseId";
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.delete;
  }
}
