import 'package:ct_morvan_app/translations/strings.g.dart';

class BioimpedanceGraphicModel {
  final DateTime day;
  final double value;
  final String group;

  const BioimpedanceGraphicModel({
    required this.day,
    required this.value,
    required this.group,
  });
}

enum BioimpedanceGroup {
  fat,
  muscle,
  weight;

  String getName() {
    switch (this) {
      case BioimpedanceGroup.fat:
        return t.fatPercentage;
      case BioimpedanceGroup.muscle:
        return t.musclePercentage;
      case BioimpedanceGroup.weight:
        return t.weight;
    }
  }
}
