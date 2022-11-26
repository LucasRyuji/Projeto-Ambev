import 'package:ambev_flutter/app/data/model/order_model.dart';
import 'package:ambev_flutter/app/data/repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class OrderDetailsAnalistaController extends GetxController {
  var orderRepository = OrderRepository();
  late OrderModel order;

  final formKey = GlobalKey<FormState>();

  final valueController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$ ');

  var loading = false.obs;

  @override
  void onInit() async {
    order = Get.arguments['order'];

    valueController.text = "${order.value.toString()}0";

    super.onInit();
  }

  save(String action) async {
    if (loading.isTrue) return;

    loading.value = true;
    if (action == 'aprovar') {
      order.statusId = 3;
      await orderRepository.update(order);
    }

    if (action == 'cancelar') {
      order.statusId = 4;
      await orderRepository.update(order);
    }

    Get.back(
      result: true,
    );

    loading.value = false;
  }
}
