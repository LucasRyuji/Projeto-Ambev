import 'dart:convert';

import 'package:ambev_flutter/app/data/base_url.dart';
import 'package:ambev_flutter/app/data/model/order_model.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderApiClient {
  final http.Client client = http.Client();

  Future<Map<String, dynamic>?> get(int userId) async {
    try {
      var uri = Uri.parse("$baseUrl/orders/get?user_id=$userId");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Ocorreu um erro, tente novamente mais tarde.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print(e);
      Helpers.toast(
        title: 'Erro',
        message: 'Ocorreu um erro inesperado.',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<Map<String, dynamic>?> getFornecedor() async {
    try {
      var uri = Uri.parse("$baseUrl/orders/getFornecedor");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Ocorreu um erro, tente novamente mais tarde.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print(e);
      Helpers.toast(
        title: 'Erro',
        message: 'Ocorreu um erro inesperado.',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<Map<String, dynamic>?> getAnalista(String type) async {
    try {
      var uri = Uri.parse("$baseUrl/orders/getAnalista?type=$type");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Ocorreu um erro, tente novamente mais tarde.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print(e);
      Helpers.toast(
        title: 'Erro',
        message: 'Ocorreu um erro inesperado.',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<Map<String, dynamic>?> store(OrderModel order) async {
    try {
      var uri = Uri.parse("$baseUrl/orders/store");
      var body = jsonEncode(
        order.toJson(),
      );

      var response = await client.post(
        uri,
        body: body,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Ocorreu um erro, tente novamente mais tarde.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print(e);
      Helpers.toast(
        title: 'Erro',
        message: 'Ocorreu um erro inesperado.',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<Map<String, dynamic>?> update(OrderModel order) async {
    try {
      var uri = Uri.parse("$baseUrl/orders/${order.id}/update");

      var body = jsonEncode(
        order.toJson(),
      );

      var response = await client.put(
        uri,
        body: body,
        headers: headers,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Ocorreu um erro, tente novamente mais tarde.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      print(e);
      Helpers.toast(
        title: 'Erro',
        message: 'Ocorreu um erro inesperado.',
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
