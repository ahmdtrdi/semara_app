import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:semara_app/services/globals.dart';

class AuthServices {
  static Future<http.Response> register(
      String name, String phonenumber, String password) async {
    Map data = {
      "name": name,
      "phone_number": phonenumber,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/auth/register');

    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }

  static Future<http.Response> login(
      String phonenumber, String password) async {
    Map data = {
      "phone_number": phonenumber,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/auth/login');

    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }
}
