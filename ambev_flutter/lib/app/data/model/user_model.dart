class User {
  int? id;
  String? name;
  String? email;
  String? username;
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
      this.active,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accessLevelId = json['access_level_id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
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
    data['access_level_id'] = accessLevelId;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
