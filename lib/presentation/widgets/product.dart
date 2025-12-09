import 'package:ecommerce_sample/db/models/product_model/product_model.dart';
import 'package:ecommerce_sample/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage()),
      ),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 136, 99, 84),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              product.title ?? "Product",
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pr.${product.price.toString()}",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 235, 237, 118),
                    fontSize: 11
                  ),
                ),
                Text(
                  "⭐${product.rating!.rate.toString()}",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 246, 243, 111),
                    fontSize: 11
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
