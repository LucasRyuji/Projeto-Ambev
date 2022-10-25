import 'package:ambev_flutter/app/modules/initial/initial_controller.dart';
import 'package:ambev_flutter/app/modules/users/users_controller.dart';
import 'package:get/get.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
