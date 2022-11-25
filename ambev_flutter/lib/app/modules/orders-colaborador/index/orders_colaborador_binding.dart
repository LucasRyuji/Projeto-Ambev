import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_controller.dart';
import 'package:get/get.dart';

class OrdersColaboradorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersColaboradorController>(() => OrdersColaboradorController());
  }
}
