import 'package:ct_morvan_app/translations/strings.g.dart';

void setPluralResolver() {
  LocaleSettings.setPluralResolver(
    locale: AppLocale.pt,
    cardinalResolver: (n, {zero, one, two, few, many, other}) {
      if (n == 0) return zero ?? other!;
      if (n == 1) return one ?? other!;
      return other!;
    },
    ordinalResolver: (n, {zero, one, two, few, many, other}) {
      if (n % 10 == 1 && n % 100 != 11) return one ?? other!;
      if (n % 10 == 2 && n % 100 != 12) return two ?? other!;
      if (n % 10 == 3 && n % 100 != 13) return few ?? other!;
      return other!;
    },
  );
}
