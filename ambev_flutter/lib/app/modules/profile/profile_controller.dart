import 'package:ambev_flutter/app/data/model/access_level_model.dart';
import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/repository/access_level_repository.dart';
import 'package:ambev_flutter/app/data/repository/auth_repository.dart';
import 'package:ambev_flutter/app/data/repository/user_repository.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_select/flutter_native_select.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var accessLevelsRepository = AccessLevelRepository();
  var userRepository = UserRepository();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  var accessLevelController = TextEditingController();

  var loading = true.obs;

  User? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var accessLevels = <AccessLevel>[].obs;
  Rxn<AccessLevel> selectedAccessLevel = Rxn();

  @override
  void onInit() async {
    super.onInit();

    loading.value = true;

    await getAccessLevels();

    await getUser();

    await setData();

    loading.value = false;
  }

  logout() async {
    var result = await Get.bottomSheet(
      CupertinoActionSheet(
        title: const Text(
          'Deseja realmente desconectar?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Get.back(
                result: true,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(
                  FontAwesomeIcons.powerOff,
                  size: 20,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Desconectar',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancelar'),
          )
        ],
      ),
    );

    if (result == true) {
      final authRepository = AuthRepository();
      await authRepository.clearAuthUserStorate();
      Get.offAllNamed('/login');
    }
  }

  getUser() async {
    Auth auth = GetStorage().read('auth') is Auth
        ? GetStorage().read('auth')
        : Auth.fromJson(GetStorage().read('auth'));
    user = auth.user!;
  }

  setData() async {
    nameController.text = user!.name!;
    emailController.text = user!.email!;
    usernameController.text = user!.username!;
    accessLevelController.text = accessLevels
        .firstWhere((element) => element.id == user!.accessLevelId!)
        .name!;
    selectedAccessLevel.value = accessLevels
        .firstWhere((element) => element.id == user!.accessLevelId!);
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
        id: this.user!.id,
        name: nameController.text,
        email: emailController.text,
        username: usernameController.text,
        password:
            passwordController.text.isEmpty ? null : passwordController.text,
        accessLevelId: selectedAccessLevel.value?.id,
      );

      user = await userRepository.update(user);

      Helpers.toast(title: 'Atualizado com sucesso', message: 'Usuário atualizado com sucesso.', backgroundColor: Colors.green,);

      loading.value = false;
    }
  }

  getAccessLevels() async {
    accessLevels.addAll(await accessLevelsRepository.get());
  }
}
