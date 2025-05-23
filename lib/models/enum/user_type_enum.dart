import 'package:ct_morvan_app/translations/strings.g.dart';

enum UserTypeEnum {
  admin,
  patient;

  @override
  String toString() {
    switch (this) {
      case UserTypeEnum.admin:
        return t.admin;
      case UserTypeEnum.patient:
        return t.patient;
    }
  }
}
