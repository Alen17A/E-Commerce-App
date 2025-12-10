import 'package:ecommerce_sample/features/all_products/bloc/product_bloc.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_cubit.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Search Products...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<ProductCubit>().fetchProducts();
        }
        context.read<ProductBloc>().add(SearchProductsEvent(value));
      },
    );
  }
}
