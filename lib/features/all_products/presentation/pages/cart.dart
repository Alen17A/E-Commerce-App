import 'package:ecommerce_sample/core/services/all_products.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart 🛒"),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.brown)),
      ),
      body: FutureBuilder(
        future: ProductsAPIService.instance.fetchPostedProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error fetching data: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Your Cart is Empty"));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image ?? "",
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: Text(product.title ?? "Product $index"),
                  trailing: Text(product.price.toString()),
                );
              },
              itemCount: products.length,
            );
          } else {
            return Text("Data not available");
          }
        },
      ),
    );
  }
}
