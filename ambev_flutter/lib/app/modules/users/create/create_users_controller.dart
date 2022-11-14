import 'package:ambev_flutter/app/data/model/access_level_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/repository/access_level_repository.dart';
import 'package:ambev_flutter/app/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_select/flutter_native_select.dart';
import 'package:get/get.dart';

class CreateUsersController extends GetxController {
  var accessLevelsRepository = AccessLevelRepository();
  var userRepository = UserRepository();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var accessLevelController = TextEditingController();

  var loading = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var accessLevels = <AccessLevel>[].obs;
  Rxn<AccessLevel> selectedAccessLevel = Rxn();

  @override
  void onInit() async {
    super.onInit();

    loading.value = true;

    await getAccessLevels();

    loading.value = false;
  }

  void showAccessLevelSelect() async {
    if (accessLevels.isNotEmpty) {
      final selectedItem = await FlutterNativeSelect.openSelect(
        title: 'Selecione um nível de acesso',
        doneText: 'Pronto!',
        clearText: 'Cancelar',
        items: List.from(
          accessLevels.map<NativeSelectItem>(
            (element) =>
                NativeSelectItem(value: element.name!, label: element.name!),
          ),
        ),
      );

      if (selectedItem != null) {
        selectedAccessLevel.value =
            accessLevels.firstWhere((element) => element.name == selectedItem);
        accessLevelController.text = selectedItem;
      }
    }
  }

  save() async {
    if (loading.value == true) return;

    if (formKey.currentState!.validate()) {
      loading.value = true;

      User? user = User(
        name: nameController.text,
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
        accessLevelId: selectedAccessLevel.value?.id,
      );

      user = await userRepository.store(user);

      if (user != null) {
        Get.back(
          result: user,
          closeOverlays: true,
        );
      }

      loading.value = false;
    }
  }

  getAccessLevels() async {
    accessLevels.addAll(await accessLevelsRepository.get());
  }
}
