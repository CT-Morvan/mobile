import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.dart';
import 'package:ct_morvan_app/translations/plural_resolver.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(TranslationProvider(child: MyApp()));
}

final appRouter = CtMorvanRoutes();

class MyApp extends StatelessWidget {
  final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    LocaleSettings.useDeviceLocale();
    setPluralResolver();

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessenger,
      title: 'CT Morvan',
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        tabBarTheme: TabBarThemeData(
          indicatorColor: primaryColor,
          labelColor: primaryColor,
          unselectedLabelColor: textColor,
          overlayColor: WidgetStateProperty.all(primaryColor.withAlpha(10)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          activeIndicatorBorder: BorderSide(color: primaryColor),
          focusColor: primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          labelStyle: TextStyle(color: textColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
        datePickerTheme: const DatePickerThemeData(
          headerBackgroundColor: primaryColor,
          backgroundColor: whiteColor,
          headerForegroundColor: whiteColor,
          surfaceTintColor: whiteColor,
        ),
      ),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
