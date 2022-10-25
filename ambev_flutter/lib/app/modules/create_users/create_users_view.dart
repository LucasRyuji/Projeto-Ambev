import 'package:ambev_flutter/app/modules/create_users/create_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUsersPage extends GetView<CreateUsersController> {
  var controller = Get.find<CreateUsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar usuários'),
      ),
      body: Container(height: 100, color: Colors.black,),
    );
  }
}
