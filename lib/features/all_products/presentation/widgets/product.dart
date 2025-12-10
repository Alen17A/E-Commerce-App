import 'package:ecommerce_sample/features/all_products/data/models/product_model/product_model.dart';
import 'package:ecommerce_sample/features/product_details/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(product: product,)),
      ),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 244, 244),
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
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
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
                    color: Colors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "⭐${product.rating!.rate.toString()}",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 159, 156, 3),
                    fontSize: 11,
                    fontWeight: FontWeight.bold
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
