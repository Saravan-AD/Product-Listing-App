import 'package:flutter/material.dart';

class ProductTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network('https://via.placeholder.com/50'),
          title: Text('Product $index'),
          subtitle: Text('\$${(index + 1) * 10}'),
        );
      },
    );
  }
}
