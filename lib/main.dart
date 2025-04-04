import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/translations/plural_resolver..dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    LocaleSettings.useDeviceLocale();
    setPluralResolver();

    return MaterialApp(
      title: 'Flutter Demo',
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: primaryColor),
        inputDecorationTheme: InputDecorationTheme(
          activeIndicatorBorder: BorderSide(color: primaryColor),
          focusColor: primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          labelStyle: TextStyle(color: textColor),
        ),
      ),
      home: const LoginView(),
    );
  }
}
