import 'package:ambev_flutter/app/modules/home/home_binding.dart';
import 'package:ambev_flutter/app/modules/home/home_view.dart';
import 'package:ambev_flutter/app/modules/initial/initial_binding.dart';
import 'package:ambev_flutter/app/modules/initial/initial_view.dart';
import 'package:ambev_flutter/app/modules/login/login_binding.dart';
import 'package:ambev_flutter/app/modules/login/login_view.dart';
import 'package:ambev_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(), //InitialView(),
      binding: InitialBinding(), // InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(), //LoginView(),
      binding: LoginBinding(), // LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(), //HomeView(),
      binding: HomeBinding(), // LoginBinding(),
    )
  ];
}