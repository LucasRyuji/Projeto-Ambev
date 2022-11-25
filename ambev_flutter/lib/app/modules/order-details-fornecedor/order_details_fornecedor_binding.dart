import 'package:ambev_flutter/app/modules/order-details-fornecedor/order_details_fornecedor_controller.dart';
import 'package:get/get.dart';

class OrderDetailsFornecedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsFornecedorController>(() => OrderDetailsFornecedorController());
  }
}
