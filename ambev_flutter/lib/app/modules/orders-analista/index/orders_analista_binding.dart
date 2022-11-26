import 'package:ambev_flutter/app/modules/orders-analista/index/orders_analista_controller.dart';
import 'package:get/get.dart';

class OrdersAnalistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersAnalistaController>(() => OrdersAnalistaController());
  }
}
