import 'package:flutter/material.dart';

import 'product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products({this.products}) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductList() {
    Widget widget = Center(
      child: Text("No Products found, please add some."),
    );
    if (products.length > 0) {
      widget = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(index, products[index]),
        itemCount: products.length,
      );
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
