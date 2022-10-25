import 'package:ambev_flutter/app/data/model/access_level_model.dart';
import 'package:ambev_flutter/app/data/repository/access_level_repository.dart';
import 'package:get/get.dart';

class CreateUsersController extends GetxController {
  var accessLevelsRepository = AccessLevelRepository();

  List<AccessLevel> accessLevels = [];

  @override
  void onInit() async {
    super.onInit();

    await getAccessLevels();
  }

  getAccessLevels () async {
    accessLevels.addAll(await accessLevelsRepository.get());

    print(accessLevels);
  }
}
