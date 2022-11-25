import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_controller.dart';
import 'package:ambev_flutter/app/modules/profile/profile_controller.dart';
import 'package:ambev_flutter/app/modules/tabs_colaborador/tabs_colaborador_controller.dart';
import 'package:get/get.dart';

class TabsColaboradorBinding implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<TabsColaboradorController>(() => TabsColaboradorController());

    Get.lazyPut<OrdersColaboradorController>(() => OrdersColaboradorController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}