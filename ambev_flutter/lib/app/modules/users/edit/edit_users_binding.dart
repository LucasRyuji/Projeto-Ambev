import 'package:ambev_flutter/app/modules/users/edit/edit_users_controller.dart';
import 'package:get/get.dart';

class EditUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUsersController>(() => EditUsersController());
  }
}
