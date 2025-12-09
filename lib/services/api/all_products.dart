import 'dart:convert';

import 'package:ecommerce_sample/db/models/product_model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsAPIService {
  final String apiUrl = "https://fakestoreapi.com/products";

  ProductsAPIService._privateConstructor();

  static final ProductsAPIService instance =
      ProductsAPIService._privateConstructor();

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final url = Uri.parse(apiUrl);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;

        List<ProductModel> allProducts = data
            .map((product) => ProductModel.fromJson(product))
            .toList();

        return allProducts;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
