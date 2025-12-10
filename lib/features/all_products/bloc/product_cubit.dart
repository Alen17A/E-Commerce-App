import 'package:ecommerce_sample/features/all_products/bloc/product_state.dart';
import 'package:ecommerce_sample/features/all_products/data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductInitial());

    try {
      final products = await productRepository.fetchAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      throw Exception(ProductError("Error fetching: $e"));
    }
  }

  Future<void> searchProducts(String query) async {
    emit(ProductLoading());

    try {
      final results = await productRepository.searchProduct(query);
      emit(ProductLoaded(results));
    } catch (e) {
      emit(ProductError("Failed to search products"));
    }
  }
}
