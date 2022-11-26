import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/model/order_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class CreateOrdersController extends GetxController {
  var orderRepository = Get.find<OrderRepository>();

  User? user;

  var loading = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var originController = TextEditingController();
  var accountController = TextEditingController();
  var costCenterController = TextEditingController();
  var destinyController = TextEditingController();
  var obsController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    loading.value = true;

    await getUser();

    loading.value = false;
  }

  getUser() async {
    Auth auth = Auth.fromJson(GetStorage().read('auth'));
    user = auth.user!;
  }

  save() async {
    if (formKey.currentState!.validate()) {
      var order = OrderModel(
        date: DateFormat('dd/MM/yyyy HH:mm')
            .parse("${dateController.text} ${timeController.text}"),
        origin: originController.text,
        destiny: destinyController.text,
        account: accountController.text,
        costCenter: costCenterController.text,
        obs: obsController.text.isNotEmpty ? obsController.text : null,
        statusId: 1,
        userId: user!.id!,
      );


      order = await orderRepository.store(order);

      Get.back(
        result: true,
      );
    }
  }
}
