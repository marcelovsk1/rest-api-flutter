import 'package:http/http.dart' as http;

const String baseUrl = 'https://631c37911b470e0e12fcdd0b.mockapi.io/api';

class BaseClient {
  var client = http.Client()
  Future<dynamic> get(String api) async {
    var url = Uri.parse(api);
    client.get(url);
  }

  Future<dynamic> post(String api) async {

  }
  Future<dynamic> put(String api) async {

  }
  Future<dynamic> delete(String api) async {

  }
}
