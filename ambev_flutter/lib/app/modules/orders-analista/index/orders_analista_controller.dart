import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/model/order_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/repository/order_repository.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrdersAnalistaController extends GetxController {
  var loading = true.obs;
  var ordersRepository = OrderRepository();
  User? user;

  String type = 'pending';

  var orders = <OrderModel>[];

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;

    await getUser();

    await getOrders();

    loading.value = false;
  }

  refreshOrders() async {
    loading.value = true;

    await getOrders();

    loading.value = false;
  }

  getUser() async {
    Auth auth = GetStorage().read('auth') is Auth
        ? GetStorage().read('auth')
        : Auth.fromJson(GetStorage().read('auth'));
    user = auth.user!;
  }

  getOrders() async {
    loading.value = true;
    orders = await ordersRepository.getAnalista(type);
    loading.value = false;
  }

  updateOrder(OrderModel order) async {
    var result = await Get.toNamed('order-details-analista', arguments: {
      'order': order,
    });

    if (result == true) {
      Helpers.toast(
        title: 'Atualizado com sucesso',
        message: 'Pedido atualizado com sucesso.',
        backgroundColor: Colors.green,
      );
    }

    await getOrders();
  }

  create() async {
    var response = await Get.toNamed('create-order');
    if (response == true) {
      await Helpers.toast(
        title: 'Pedido realizado',
        message: 'Pedido realizado com sucesso',
        backgroundColor: Colors.green,
      );
      await getOrders();
    }
  }
}
