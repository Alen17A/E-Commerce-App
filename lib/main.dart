import 'package:ecommerce_sample/core/services/all_products.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_bloc.dart';
import 'package:ecommerce_sample/features/all_products/bloc/product_cubit.dart';
import 'package:ecommerce_sample/features/all_products/data/repositories/product_repository.dart';
import 'package:ecommerce_sample/features/all_products/presentation/pages/main_page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final productService = ProductsAPIService.instance;
    final productRepository = ProductRepository(productService);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit(productRepository)),
        BlocProvider(create: (_) => ProductBloc(productRepository))
      ],
      child: MaterialApp(
        title: 'E-Commerce App using BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        ),
        debugShowCheckedModeBanner: false,
        home: MainPageNavigation(),
      ),
    );
  }
}
