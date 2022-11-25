import 'package:ambev_flutter/app/data/repository/order_repository.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/create/create_orders_controller.dart';
import 'package:get/get.dart';

class CreateOrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrdersController>(() => CreateOrdersController());
    Get.lazyPut<OrderRepository>(() => OrderRepository());
  }
}
