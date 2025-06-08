import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Features/Shop/Models/band.dart';

class BrandService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/v1/brands';

  static Future<List<Brand>> fetchBrands() async {
    final response = await http.get(Uri.parse('$baseUrl/brands'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => Brand.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load brands');
    }
  }

  static Future<bool> createBrand(String name, String logo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/brand'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'logo': logo}),
    );
    return response.statusCode == 201;
  }
}