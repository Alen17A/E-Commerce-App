// import 'dart:convert';

// import 'package:ecommerce_sample/features/all_products/data/models/product_model/product_model.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;

// class ProductsAPIService {
//   // FakeStore API url to get all product data
//   final String apiUrl = "https://fakestoreapi.com/products";
//   final String mockApiUrl =
//       "https://69389b2d4618a71d77d0c995.mockapi.io/ecom/v1";

//   ProductsAPIService._privateConstructor();

//   static final ProductsAPIService instance =
//       ProductsAPIService._privateConstructor();

//   // Fetching products from Fakestore API (GET)
//   Future<List<ProductModel>> fetchAllProducts() async {
//     try {
//       final url = Uri.parse(apiUrl);
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body) as List<dynamic>;

//         List<ProductModel> allProducts = data
//             .map((product) => ProductModel.fromJson(product))
//             .toList();

//         return allProducts;
//       } else {
//         throw Exception("Failed to load data: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Error fetching data: $e");
//     }
//   }

//   // Adding a product to cart with MockAPI (POST)
//   Future<int> addProduct(ProductModel product) async {
//     try {
//       final url = Uri.parse("$mockApiUrl/cart");

//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(product.toJson()),
//       );

//       debugPrint("${response.statusCode}");

//       return response.statusCode;
//     } catch (e) {
//       throw Exception("Error posting data: $e");
//     }
//   }

//   // Fetching posted products from MockAPI (GET)
//   Future<List<ProductModel>> fetchPostedProducts() async {
//     try {
//       final url = Uri.parse("$mockApiUrl/cart");
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body) as List<dynamic>;

//         List<ProductModel> allProducts = data
//             .map((product) => ProductModel.fromJsonMock(product))
//             .toList();

//         debugPrint(response.body);

//         return allProducts;
//       } else {
//         throw Exception("Failed to load data: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Error fetching data: $e");
//     }
//   }
// }
