import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 100, fit: BoxFit.cover),
            Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            // Text('\$${product.price.toString()}'),
          ],
        ),
      ),
    );
  }
}
