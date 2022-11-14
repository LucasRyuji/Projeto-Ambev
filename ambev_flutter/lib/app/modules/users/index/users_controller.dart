import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/repository/user_repository.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  var userRepository = UserRepository();

  late ScrollController scrollController;
  var nameController = TextEditingController();

  var users = <User>[].obs;

  var take = 5;
  var page = 1;
  int totalData = 0;
  var loadingPagination = false.obs;

  var loading = true.obs;

  @override
  void onInit() async {
    super.onInit();

    scrollController = ScrollController()..addListener(_scrollListener);

    await getUsers();
  }

  _scrollListener() async {
    if (totalData == users.length) {
      return;
    }
    if (scrollController.position.extentAfter <= 0 &&
        loadingPagination.value == false) {
      await getUsers();
    }
  }

  delete(User user, BuildContext context) async {
    var data = await Helpers.confirm(
        title: 'Tem certeza?',
        message: 'Deseja mesmo excluir esse usuário?',
        backText: 'Cancelar',
        confirmColor: Colors.redAccent,
        confirmText: 'Confirmar',
        context: context);

    if (data == true) {
      var response = await userRepository.delete(user);

      if (response?['error'] == false) {
        users.remove(user);
        Helpers.toast(
            title: 'Removido com sucesso',
            message: 'Usuário removido com successo.',
            backgroundColor: Colors.green);
      }
    }
  }

  edit(User user) async {
    var response = await Get.toNamed('/users/edit', arguments: {
      'user': user,
    });

    if (response != null && response is User) {
      Helpers.toast(
        title: 'Usuário alterado',
        message: 'Usuário alterado com sucesso.',
        backgroundColor: Colors.green,
      );
      await getUsers(refresher: true);
    }
  }

  create() async {
    var response = await Get.toNamed('/users/create');

    if (response != null && response is User) {
      Helpers.toast(
        title: 'Usuário criado',
        message: 'Usuário criado com sucesso',
        backgroundColor: Colors.green,
      );
      await getUsers(refresher: true);
    }
  }

  getUsers({
    bool refresher = false,
  }) async {
    if (page > 1 || refresher == true) {
      if (refresher == true) {
        page = 1;
        users.clear();
      }
      loadingPagination.value = true;
    }

    var response = await userRepository.get({
      'take': take,
      'page': page,
      'name': nameController.text,
    });

    if (response != null) {
      totalData = response['users']['total'];
      page = response['users']['current_page'] + 1;
      users.addAll(response['users']['data']
          .map<User>((e) => User.fromJson(e))
          .toList());
    }

    loadingPagination.value = false;
    loading.value = false;
  }
}
