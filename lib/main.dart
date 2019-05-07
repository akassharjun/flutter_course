import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import './pages/manage_products.dart';
import './pages/auth.dart';
import './pages/product.dart';
import './pages/products.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _removeProduct() {
    setState(() {
      _products.removeAt(_products.length - 1);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(int index, Map<String, dynamic> product) {
    setState(() {
      _products[index] = product;
    });
  }

  final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    accentColor: Colors.deepPurple,
    buttonColor: Colors.deepPurpleAccent,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) =>
            ProductsPage(products: _products),
        '/manageProducts': (BuildContext context) => ManageProductsPage(
              addProduct: _addProduct,
              removeProduct: _removeProduct,
              deleteProduct: _deleteProduct,
              products: _products,
              updateProduct : _updateProduct
            ),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                  title: _products[index]['title'],
                  imageUrl: _products[index]['image'],
                  price: _products[index]['price'],
                  description: _products[index]['description'],
                ),
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(
                  products: _products,
                ));
      },
    );
  }
}
