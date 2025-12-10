import 'package:ecommerce_sample/core/services/all_products.dart';
import 'package:ecommerce_sample/features/all_products/data/models/product_model/product_model.dart';
import 'package:ecommerce_sample/features/product_details/presentation/widgets/product_data_numbers.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.category!.toUpperCase()),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.brown)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image ?? "",
                fit: BoxFit.contain,
                width: double.infinity,
                height: 300,
              ),
              SizedBox(height: 15),
              Text(
                product.title ?? "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                maxLines: 2,
              ),
              SizedBox(height: 20),
              ProductDataNumbers(product: product),
              SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(product.description!),
              SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () async {
                    int statusCode = await ProductsAPIService.instance
                        .addProduct(product);
                    if (statusCode == 201) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added successfully")),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to add with error: $statusCode")),
                      );
                    }
                  },
                  label: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.brown),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
