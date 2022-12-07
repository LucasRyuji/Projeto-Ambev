import 'package:ambev_flutter/app/routes/app_pages.dart';
import 'package:ambev_flutter/app/routes/app_routes.dart';
import 'package:ambev_flutter/app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: 'Ambev App',
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.routes,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      MonthYearPickerLocalizations.delegate,
    ],
    supportedLocales: const [Locale('pt', 'BR')],
  ));
}
