import 'package:ecommerce_sample/core/services/all_products.dart';
import 'package:ecommerce_sample/features/all_products/data/models/product_model/product_model.dart';

class ProductRepository {
  final ProductsAPIService productsAPIService;

  ProductRepository(this.productsAPIService);

  Future<List<ProductModel>> fetchAllProducts() async {
    final responseBody = await productsAPIService.fetchAllProducts();

    List<ProductModel> allProducts = responseBody
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return allProducts;
  }

  Future<List<ProductModel>> searchProduct(String query) async {
    final responseBody = await productsAPIService.fetchAllProducts();

    List<ProductModel> products = responseBody
        .map((product) => ProductModel.fromJson(product))
        .toList();

    final filteredProducts = products.where((product) {
      return product.title!.toLowerCase().trim().contains(query.toLowerCase().trim());
    }).toList();

    return filteredProducts;
  }
}
