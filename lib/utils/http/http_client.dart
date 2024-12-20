// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class MHttpHelper {
  MHttpHelper._();

  static final _client = http.Client();

  // GET request
  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _client.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make GET request: $e');
    }
  }

  // POST request
  static Future<dynamic> post(String url,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make POST request: $e');
    }
  }

  // PUT request
  static Future<dynamic> put(String url,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await _client.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make PUT request: $e');
    }
  }

  // DELETE request
  static Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _client.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to delete data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make DELETE request: $e');
    }
  }
}


