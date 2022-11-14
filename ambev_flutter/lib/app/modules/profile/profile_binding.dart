import 'package:ambev_flutter/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';

class EditUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
