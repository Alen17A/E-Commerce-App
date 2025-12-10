import 'package:ecommerce_sample/features/all_products/bloc/product_event.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_state.dart';
import 'package:ecommerce_sample/features/all_products/data/models/product_model/product_model.dart';
import 'package:ecommerce_sample/features/all_products/data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        final List<ProductModel> products = await productRepository
            .fetchAllProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<SearchProductsEvent>((event, emit) async {
      emit(ProductLoading());

      try {
        final results = await productRepository.searchProduct(event.query);
        emit(ProductLoaded(results));
      } catch (e) {
        emit(ProductError("Failed to search products"));
      }
    });
  }
}
