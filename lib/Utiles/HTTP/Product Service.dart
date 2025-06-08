import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Features/Shop/Models/product.dart';

class ProductService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/v1/products';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<bool> createProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/product'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );
    return response.statusCode == 201;
  }
}