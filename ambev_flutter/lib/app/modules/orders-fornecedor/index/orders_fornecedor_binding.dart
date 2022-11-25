import 'package:ambev_flutter/app/modules/orders-fornecedor/index/orders_fornecedor_controller.dart';
import 'package:get/get.dart';

class OrdersFornecedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersFornecedorController>(() => OrdersFornecedorController());
  }
}
