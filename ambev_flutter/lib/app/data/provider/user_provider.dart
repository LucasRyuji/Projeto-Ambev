import 'dart:convert';

import 'package:ambev_flutter/app/data/base_url.dart';
import 'package:ambev_flutter/app/data/model/user_model.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApiClient {
  final http.Client httpClient = http.Client();

  Future<Map<String, dynamic>?> delete(User user) async {
    try {
      var response = await httpClient
          .delete(Uri.parse("$baseUrl/users/${user.id}/delete"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Erro ao excluir usuário.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Helpers.toast(
        title: 'Erro',
        message: 'Erro ao excluir usuário.',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<Map<String, dynamic>?> get(Map<String, dynamic>? wheres) async {
    try {
      String wheresString = '';
      if (wheres != null) {
        wheresString = Helpers.handleWheres(wheres);
      }

      var response = await httpClient.get(Uri.parse(
        "$baseUrl/users/paginate$wheresString",
      ));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Erro ao recuperar usuários.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Helpers.toast(
        title: 'Erro',
        message: 'Erro ao recuperar usuários.',
        backgroundColor: Colors.redAccent,
      );
    }
  }

  Future<Map<String, dynamic>?> store(User user) async {
    try {
      var response = await httpClient.post(
        Uri.parse("$baseUrl/users/create"),
        body: jsonEncode(user.toJson()),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Erro ao criar usuário.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Helpers.toast(
        title: 'Erro',
        message: 'Erro ao criar usuário.',
        backgroundColor: Colors.redAccent,
      );
    }

    return null;
  }

  Future<Map<String, dynamic>?> update(User user) async {
    try {
      var response = await httpClient.post(
        Uri.parse("$baseUrl/users/${user.id}/edit"),
        body: jsonEncode(user.toJson()),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Erro ao editar usuário.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Helpers.toast(
        title: 'Erro',
        message: 'Erro ao editar usuário.',
        backgroundColor: Colors.redAccent,
      );
    }

    return null;
  }
}
