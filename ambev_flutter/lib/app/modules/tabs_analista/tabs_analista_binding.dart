import 'package:ambev_flutter/app/modules/orders-analista/index/orders_analista_controller.dart';
import 'package:ambev_flutter/app/modules/profile/profile_controller.dart';
import 'package:ambev_flutter/app/modules/tabs_analista/tabs_analista_controller.dart';
import 'package:ambev_flutter/app/modules/users/index/users_controller.dart';
import 'package:get/get.dart';

class TabsAnalistaBinding implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<TabsAnalistaController>(() => TabsAnalistaController());

    Get.lazyPut<UsersController>(() => UsersController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<OrdersAnalistaController>(() => OrdersAnalistaController());
  }
}