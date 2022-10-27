import 'package:ambev_flutter/app/data/model/auth_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/data/provider/user_provider.dart';

class UserRepository {
  final UserApiClient api = UserApiClient();

  Future<Map<String, dynamic>?> delete(User user) async {
    var response = await api.delete(user);

    return response;
  }
  Future<Map<String, dynamic>?> get(Map<String, dynamic>? wheres) async {
    var response = await api.get(wheres);

    return response;
  }

  Future<User?> store(User user) async {
    var response = await api.store(user);

    return User.fromJson(response?['user']);
  }
}
