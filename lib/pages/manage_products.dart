import 'package:flutter/material.dart';
import './product_list.dart';
import './product_create.dart';

class ManageProductsPage extends StatelessWidget {
  final Function addProduct;
  final Function removeProduct;
  final Function deleteProduct;

  ManageProductsPage({this.addProduct, this.removeProduct, this.deleteProduct});

  Drawer _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            title: Text("All Products"),
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                '/products',
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Manage Products',
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.create), text: 'Create Product'),
              Tab(icon: Icon(Icons.list), text: 'My Products')
            ],
          ),
        ),
        drawer: _buildSideDrawer(context),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(
              addProduct: addProduct,
            ),
            ProductListPage()
          ],
        ),
      ),
    );
  }
}
