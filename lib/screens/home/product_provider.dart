import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _selectedProducts = [];

  List<Product> get selectedProducts => _selectedProducts;

  void addProductToSelection(Product product) {
    _selectedProducts.add(product);
    notifyListeners();
  }

  void removeProductFromSelection(Product product) {
    _selectedProducts.remove(product);
    notifyListeners();
  }

  void fetchProducts(List<Product> products) {
    _selectedProducts = products;
    notifyListeners();
  }
}
