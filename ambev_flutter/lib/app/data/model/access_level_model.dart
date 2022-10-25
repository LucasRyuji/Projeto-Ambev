class AccessLevel {
  int? id;
  String? name;

  AccessLevel({
    required this.id,
    required this.name,
  });

  AccessLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
