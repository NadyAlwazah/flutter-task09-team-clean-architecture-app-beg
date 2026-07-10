import 'dart:convert';
import 'dart:io';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/app_link.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // POST Request
  static Future<dynamic> postData({
    required String endpoint,
    required String baseUrl,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    if (header != null) {
      headers.addAll(header);
    }

    final uri = Uri.parse("$baseUrl$endpoint");

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _processResponse(response);
    } on SocketException {
      throw Exception("No Internet connection available.");
    }
  }

  // GET Request
  static Future<dynamic> getData(
    String endpoint, {
    Map<String, String>? header,
  }) async {
    Map<String, String> headers = {};

    if (header != null) {
      headers.addAll(header);
    }

    final uri = Uri.parse("${AppLink.baseUrl}$endpoint");

    try {
      final response = await http.get(uri, headers: headers);
      return _processResponse(response);
    } on SocketException {
      throw Exception("No Internet connection available.");
    }
  }

  // معالجة الاستجابة
  static dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);

      case 400:
        throw Exception("Bad Request: ${response.body}");

      case 401:
      case 403:
        throw Exception("Unauthorized access. Verification required.");

      case 500:
      default:
        throw Exception(
          "Server Error Occurred with Status Code: ${response.statusCode}",
        );
    }
  }
}
