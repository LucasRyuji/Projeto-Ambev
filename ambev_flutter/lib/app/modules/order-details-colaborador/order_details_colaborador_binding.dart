import 'package:ambev_flutter/app/modules/order-details-colaborador/order_details_colaborador_controller.dart';
import 'package:get/get.dart';

class OrderDetailsColaboradorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsColaboradorController>(() => OrderDetailsColaboradorController());
  }
}
