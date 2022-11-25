import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/provider/auth_provider.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final AuthApiClient api = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    return Auth.fromJson(await api.login(username, password));
  }

  clearAuthUserStorate() async {
    final storage = GetStorage();
    await storage.remove('auth');
  }
}
