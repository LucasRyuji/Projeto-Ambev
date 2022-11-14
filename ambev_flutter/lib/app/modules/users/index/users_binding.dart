import 'package:ambev_flutter/app/modules/users/index/users_controller.dart';
import 'package:get/get.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
