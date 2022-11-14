import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ambev_flutter/app/routes/app_routes.dart';

class InitialController extends GetxController {
  final box = GetStorage();

  verifyAuth() {
    if (box.read('auth') != null) {
      Auth auth = Auth.fromJson(box.read('auth'));
      if (auth.accessToken != null) {
        if (auth.user?.accessLevelId == 1) {
          return Routes.USERS;
        } else if (auth.user?.accessLevelId == 3) {
          return Routes.TABS_ANALISTA;
        }
        return Routes.LOGIN;
      }
    } else {
      return Routes.LOGIN;
    }
  }
}
