import 'package:ambev_flutter/app/modules/users/create/create_users_controller.dart';
import 'package:get/get.dart';

class CreateUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateUsersController>(() => CreateUsersController());
  }
}
