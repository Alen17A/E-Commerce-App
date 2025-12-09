import 'package:ecommerce_sample/presentation/widgets/product.dart';
import 'package:ecommerce_sample/services/api/all_products.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductsAPIService.instance.fetchAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error occured: ${snapshot.error.toString()}");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text("No Products found");
        } else if (snapshot.hasData) {
          final products = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Product(product: product);
            },
            itemCount: products.length,
          );
        } else {
          return Text("Data not available");
        }
      },
    );
  }
}
