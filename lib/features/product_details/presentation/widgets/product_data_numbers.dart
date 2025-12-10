import 'package:ecommerce_sample/features/all_products/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDataNumbers extends StatelessWidget {
  final ProductModel product;
  const ProductDataNumbers({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 144, 105, 92),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    product.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Rating",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    "⭐${product.rating!.rate}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: product.rating!.rate! > 3 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Stock",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    product.rating!.count.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
