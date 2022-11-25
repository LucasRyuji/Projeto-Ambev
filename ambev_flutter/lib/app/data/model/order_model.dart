import 'package:ambev_flutter/app/data/model/status_model.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:intl/intl.dart';

class OrderModel {
  int? id;
  DateTime date;
  String? driver;
  String? car;
  String origin;
  String destiny;
  String? type;
  String account;
  String costCenter;
  String? obs;
  double? value;
  int statusId;
  int userId;

  User? user;
  Status? status;

  OrderModel({
    this.id,
    required this.date,
    this.driver,
    this.car,
    required this.origin,
    required this.destiny,
    this.type,
    required this.account,
    required this.costCenter,
    this.obs,
    required this.userId,
    required this.statusId,
    this.user,
    this.status,
    this.value,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var date = DateFormat('yyyy-MM-dd hh:mm:ss').parse(json['date']);
    return OrderModel(
      id: json['id'],
      date: date,
      driver: json['driver'],
      car: json['car'],
      origin: json['origin'],
      destiny: json['destiny'],
      type: json['type'],
      account: json['account'],
      costCenter: json['cost_center'],
      obs: json['obs'],
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
      value: json['value'] is int ? json['value'].toDouble() : json['value'] is String ? double.parse(json['value']) : json['value'],
      statusId: json['status_id'],
      userId: json['user_id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': DateFormat('yyyy-MM-dd hh:mm:ss').format(date),
        'driver': driver,
        'car': car,
        'origin': origin,
        'destiny': destiny,
        'type': type,
        'value': value,
        'account': account,
        'cost_center': costCenter,
        'obs': obs,
        'status_id': statusId,
        'user_id': userId,
      };
}
