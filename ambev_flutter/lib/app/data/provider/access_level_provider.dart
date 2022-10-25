import 'dart:convert';

import 'package:ambev_flutter/app/data/base_url.dart';
import 'package:http/http.dart' as http;

class AccessLevelApiClient {
  final http.Client httpClient = http.Client();

  Future<Map<String, dynamic>> get () async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/access-levels/get"));
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
