import 'package:ct_morvan_app/view/models/tests/maximum_rep/maximum_rep_model.dart';

class MaximumRepResultModel {
  final String? exerciseName;
  final int? exerciseId;
  final List<MaximumRepModel>? results;

  const MaximumRepResultModel({
    required this.exerciseName,
    required this.exerciseId,
    required this.results,
  });
}
