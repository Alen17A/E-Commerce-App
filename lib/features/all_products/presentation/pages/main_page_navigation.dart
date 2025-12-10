import 'package:ecommerce_sample/features/all_products/presentation/pages/cart.dart';
import 'package:ecommerce_sample/features/all_products/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPageNavigation extends StatefulWidget {
  const MainPageNavigation({super.key});

  @override
  State<MainPageNavigation> createState() => _MainPageNavigationState();
}

class _MainPageNavigationState extends State<MainPageNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = [HomePage(), Cart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Products"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
