import 'package:ct_morvan_app/models/exercises/exercise_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class CreateExercisesApi extends Api<Map<String, dynamic>, ExerciseModel?> {
  final String exerciseName;
  CreateExercisesApi({required this.exerciseName});

  @override
  ExerciseModel? getResponseApi(Map<String, dynamic> data) {
    ExerciseModel? exercise;

    if (data.containsKey("data")) {
      exercise = ExerciseModel.fromJson(data["data"]);
    }

    return exercise;
  }

  @override
  String getUrl() {
    return "exercises";
  }

  @override
  Object? getBody() {
    return {"name": exerciseName};
  }

  @override
  HttpMethod getMethod() {
    return HttpMethod.post;
  }
}
