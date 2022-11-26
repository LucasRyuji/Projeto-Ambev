import 'package:ambev_flutter/app/modules/order-details-analista/order_details_analista_controller.dart';
import 'package:ambev_flutter/app/modules/order-details-fornecedor/order_details_fornecedor_controller.dart';
import 'package:get/get.dart';

class OrderDetailsAnalistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsAnalistaController>(() => OrderDetailsAnalistaController());
  }
}
