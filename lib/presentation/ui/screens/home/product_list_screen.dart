import 'package:crafty_bay/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.68,
              crossAxisSpacing: 2,
              mainAxisSpacing: 4
            ),
            itemBuilder: (context, index) {
              //return  ProductCard();
            }),
      ),
    );
  }
}
