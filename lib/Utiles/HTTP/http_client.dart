import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static const String _baseUrl = '-_-';

  //register
  static Future<Map<String, dynamic>> register(
      String firstName,
      String lastName,
      String username,
      String phoneNumber,
      String email,
      String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json;  charset=UTF-8'},
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      }),
    );
    return _handleResponse(response);
  }

  //login
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    return _handleResponse(response);
  }

  //logout
  static Future<Map<String, dynamic>> logout() async {
    final response = await http.post(
      Uri.parse('$_baseUrl/logout'),
      headers: {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }

  // static Future<Map<String, dynamic>> get(String endpoint) async {
  //   final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
  //   return _handleResponse(response);
  // }
  //
  // static Future<Map<String, dynamic>> post(
  //     String endpoint, dynamic data) async {
  //   final response = await http.post(
  //     Uri.parse('$_baseUrl/$endpoint'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(data),
  //   );
  //   return _handleResponse(response);
  // }
  //
  // static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
  //   final response = await http.put(
  //     Uri.parse('$_baseUrl/$endpoint'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(data),
  //   );
  //   return _handleResponse(response);
  // }
  //
  // static Future<Map<String, dynamic>> delete(String endpoint) async {
  //   final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
  //   return _handleResponse(response);
  // }
  //
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
