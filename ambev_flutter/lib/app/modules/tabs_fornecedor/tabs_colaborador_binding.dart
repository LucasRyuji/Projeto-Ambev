import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_controller.dart';
import 'package:ambev_flutter/app/modules/orders-fornecedor/index/orders_fornecedor_controller.dart';
import 'package:ambev_flutter/app/modules/profile/profile_controller.dart';
import 'package:ambev_flutter/app/modules/tabs_fornecedor/tabs_colaborador_controller.dart';
import 'package:get/get.dart';

class TabsFornecedorBinding implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<TabsFornecedorController>(() => TabsFornecedorController());

    Get.lazyPut<OrdersFornecedorController>(() => OrdersFornecedorController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}