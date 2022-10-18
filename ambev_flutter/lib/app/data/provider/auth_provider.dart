import 'dart:convert';
import 'package:ambev_flutter/app/data/base_url.dart';
import 'package:http/http.dart' as http;

class AuthApiClient {
  final http.Client httpClient = http.Client();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + '/login'), body: {
        "username": username,
        "password": password,
      });
      print(response);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('erro -get:' + response.body);
      }
    } catch (e) {
      print(e);
    }
    return {};
  }
}
