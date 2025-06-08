import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Features/Shop/Models/category.dart';

class CategoryService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/v1/categories';

  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<bool> createCategory(String name, String icon) async {
    final response = await http.post(
      Uri.parse('$baseUrl/category'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'icon': icon}),
    );
    return response.statusCode == 201;
  }
}