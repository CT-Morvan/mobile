import 'package:ct_morvan_app/models/exercises/exercise_model.dart';
import 'package:ct_morvan_app/sdk/api/api.dart';

class ListExercisesApi extends Api<Map<String, dynamic>, List<ExerciseModel>> {
  ListExercisesApi();

  @override
  List<ExerciseModel> getResponseApi(Map<String, dynamic> data) {
    List<ExerciseModel> exercises = [];

    if (data.containsKey("data")) {
      for (var element in data["data"]) {
        final exercise = ExerciseModel.fromJson(element);
        exercises.add(exercise);
      }
    }

    return exercises;
  }

  @override
  String getUrl() {
    return "exercises";
  }
}
