import 'package:ambev_flutter/app/data/model/access_level_model.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? password;
  AccessLevel? accessLevel;
  bool? active;
  int? accessLevelId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.password,
      this.accessLevelId,
      this.active,
      this.accessLevel,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  get accessLevelName {
    switch (accessLevelId) {
      case 1:
        return 'Administrador';
      case 2:
        return 'Colaborador';
      case 3:
        return 'Analista';
      case 4:
        return 'Fornecedor';
      default:
        return '';
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accessLevelId = json['access_level_id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    accessLevel = json['access_level'] != null
        ? AccessLevel.fromJson(json['access_level'])
        : null;
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['access_level_id'] = accessLevelId;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
