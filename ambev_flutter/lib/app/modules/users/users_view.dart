import 'package:ambev_flutter/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Usuários'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/users/create');
              },
              icon: const Icon(Icons.add_box),
            )
          ],
        ),
        body: SizedBox());
  }
}
