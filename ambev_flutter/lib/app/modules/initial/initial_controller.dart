import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ambev_flutter/app/routes/app_routes.dart';

class InitialController extends GetxController {
  final box = GetStorage();

  verifyAuth() {
    if (box.read('auth') != null) {
      Auth auth = box.read('auth') is Auth ? box.read('auth') : Auth.fromJson(box.read('auth'));
      if (auth.accessToken != null) {
        if (auth.user?.accessLevelId == 1) {
          return Routes.USERS;
        } else if (auth.user?.accessLevelId == 3) {
          return Routes.TABS_ANALISTA;
        } else if (auth.user?.accessLevelId == 2) {
          return Routes.TABS_COLABORADOR;
        } else if (auth.user?.accessLevelId == 4) {
          return Routes.TABS_FORNECEDOR;
        }
        return Routes.LOGIN;
      }
    } else {
      return Routes.LOGIN;
    }
  }
}
