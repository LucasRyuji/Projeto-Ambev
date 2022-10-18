import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient api = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    return Auth.fromJson(await api.login(username, password));
  }
}
