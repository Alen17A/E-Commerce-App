import 'package:ecommerce_sample/presentation/widgets/products_grid.dart';
import 'package:ecommerce_sample/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 204, 198),
      appBar: AppBar(title: Text("ECOM"), centerTitle: true, forceMaterialTransparency: true,),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchBarWidget(),
            SizedBox(height: 30),
            Expanded(
              child: ProductsGrid()
            ),
          ],
        ),
      ),
    );
  }
}
