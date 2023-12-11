import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/user.dart';

const String baseUrl = 'https://631c37911b470e0e12fcdd0b.mockapi.io/api';

class BaseClient {
  var client = http.Client();

  // GET
  Future<dynamic> get(String api) async {
  var url = Uri.parse(baseUrl + api);
  var _headers = {
    'Authorization': 'Bearer sfie328370428387=',
    'api_key': 'ief873fj38uf38uf83u839898989',
  };

  var response = await client.get(url, headers: _headers);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    // throw exception and catch it in UI
  }
}

  Future<dynamic> post(String api, dynamic object) async {
  var url = Uri.parse(baseUrl + api);
  var _payload = json.encode(object);
  var _headers = {
    'Authorization': 'Bearer sfie328370428387=',
    'api_key': 'ief873fj38uf38uf83u839898989',
  };

  var response = await client.post(url, body: _payload, headers: _headers);
  if (response.statusCode == 201) {
    return response.body;
  } else {
    // throw exception and catch it in UI
  }
}
  Future<dynamic> put(String api, User user) async {

  }
  Future<dynamic> delete(String api) async {

  }
}
