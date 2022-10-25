import 'package:ambev_flutter/app/data/model/user_model.dart';

class Auth {
  User? user;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Auth({this.user, this.accessToken, this.tokenType, this.expiresIn});

  Auth.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
