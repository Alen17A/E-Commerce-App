import 'package:ecommerce_sample/features/all_products/bloc/product_bloc.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_cubit.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_event.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_state.dart';
import 'package:ecommerce_sample/features/all_products/presentation/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<ProductCubit>().fetchProducts();
    context.read<ProductBloc>().add(LoadProductsEvent());
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial || state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductError) {
          return Text("Error loading data");
        } else if (state is ProductLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Product(product: product);
            },
            itemCount: state.products.length,
          );
        } else {
          return Center(child: Text("Data not available"));
        }
      },
    );
  }
}
