import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();
  final formKey = GlobalKey<FormState>();
  late Auth auth;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  final box = GetStorage();

  void login() async {
    if (formKey.currentState!.validate()) {
      loading.value = true;
      auth = await repository.login(usernameCtrl.text, passwordCtrl.text);
      if (!(auth.accessToken == null)) {
        box.write('auth', auth);
        print(auth.user?.accessLevelId);
        if (auth.user?.accessLevelId == 1) {
          Get.offAllNamed('/users');
        } else if (auth.user?.accessLevelId == 3) {
          Get.offAllNamed('/tabs-analista');
        } else if (auth.user?.accessLevelId == 2) {
          Get.offAllNamed('/tabs-colaborador');
        } else if (auth.user?.accessLevelId == 4) {
          Get.offAllNamed('/tabs-fornecedor');
        }
      }
      loading.value = false;
    }
  }
}
