import 'dart:convert';
import 'package:ambev_flutter/app/data/base_url.dart';
import 'package:ambev_flutter/app/global/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthApiClient {
  final http.Client httpClient = http.Client();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + '/login'), body: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        Helpers.toast(
          title: 'Informações incorretas',
          message: 'Usuário ou senha inválidos.',
          backgroundColor: Colors.orange,
        );
      } else {
        Helpers.toast(
          title: 'Erro',
          message: 'Ocorreu um erro, tente novamente mais tarde.',
          backgroundColor: Colors.redAccent,
        );
      }
    } catch (e) {
      Helpers.toast(
        title: 'Erro',
        message: 'Ocorreu um erro, tente novamente mais tarde.',
        backgroundColor: Colors.redAccent,
      );
    }
    return {};
  }
}
