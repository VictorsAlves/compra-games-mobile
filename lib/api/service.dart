import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:compra_games/settings/api-settings.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:z_components/components/z-injector/z-injector.dart';

abstract class Service {
  static const String HTTP_GET = "HTTP_GET";
  static const String HTTP_POST = "HTTP_POST";
  static const String HTTP_PUT = "HTTP_PUT";
  static const String HTTP_PATCH = "HTTP_PATCH";
  static const String HTTP_DELETE = "HTTP_DELETE";

  String serverErrorMessage = "";
  String exceptionMessage = "";

  int timeout = 10;

  Map<String, String> headers = new HashMap<String, String>();

  SharedPreferences sharedPreferences;

  Service() {
    buildAuthorizationHeaders();
  }

  Future buildAuthorizationHeaders() async {
    sharedPreferences = await SharedPreferences.getInstance();

    headers[HttpHeaders.contentTypeHeader] = "application/json";
    headers[HttpHeaders.authorizationHeader] =
        "Bearer ${sharedPreferences.getString(ApiSettings.API_TOKEN)}";
  }

  Future<http.Response> request(String url, String method,
      {dynamic body}) async {
    http.Response response;

    try {
      await buildAuthorizationHeaders();

      switch (method) {
        case HTTP_GET:
          response = await http.get(url, headers: this.headers);
          break;
        case HTTP_POST:
          response = await http
              .post(url,
                  body: body != null ? json.encode(body) : {},
                  headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;
        case HTTP_PUT:
          response = await http
              .put(url,
                  body: body != null ? json.encode(body) : {},
                  headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;
        case HTTP_PATCH:
          response = await http
              .patch(url,
                  body: body != null ? json.encode(body) : {},
                  headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;
        case HTTP_DELETE:
          response = await http
              .delete(url, headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;
      }

      if (response != null) {
        if (response.statusCode == 401) {
          //redireciona login
          return await request(url, method, body: body);
        }
      }

      return response;
    } catch (e) {
      serverErrorMessage = response.body;
      exceptionMessage = e;

      return null;
    }
  }
}
