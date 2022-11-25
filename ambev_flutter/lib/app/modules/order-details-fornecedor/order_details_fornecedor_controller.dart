import 'package:ambev_flutter/app/data/model/order_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/repository/order_repository.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class OrderDetailsFornecedorController extends GetxController {
  var orderRepository = OrderRepository();
  late OrderModel order;

  final formKey = GlobalKey<FormState>();

  final carController = TextEditingController();
  final driverController = TextEditingController();
  final valueController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$ ');

  var loading = false.obs;

  @override
  void onInit() async {
    order = Get.arguments['order'];
    super.onInit();
  }

  save() async {
    if (loading.isTrue) return;

    if (formKey.currentState!.validate()) {
      loading.value = true;

      double value = double.parse(valueController.text
          .replaceAll('R\$ ', '')
          .replaceAll('.', '')
          .replaceAll(',', '.'));

      order.car = carController.text;
      order.driver = carController.text;
      order.value = value;
      order.statusId = 2;

      await orderRepository.update(order);

      Get.back(
        result: true,
      );

      loading.value = false;
    }
  }
}
