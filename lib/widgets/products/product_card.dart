import 'package:flutter/material.dart';

import 'price_tag.dart';
import '../uiElements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  ProductCard(this.index, this.product);

  Container _buildTitlePriceContainer() {
    return Container(
        margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(product['title']),
            SizedBox(width: 8.0),
            PriceTag(price: product['price'].toString()),
          ],
        ));
  }

  ButtonBar _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + index.toString()),
          color: Theme.of(context).accentColor,
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () => {},
          color: Colors.red,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: Image.asset(product['image']),
          ),
          _buildTitlePriceContainer(),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text('Union Square, San Francisco'),
          ),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
