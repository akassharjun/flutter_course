import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage({this.addProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _title = '';
  double _price = 0;
  String _description = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;

  TextFormField _buildTitleTextField() {
    return TextFormField(
      onSaved: (String value) {
        _title = value;
      },
      decoration: InputDecoration(labelText: "Enter Title"),
//      autovalidate: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return "Title is required and should be 5+ characters long";
        }
        return null;
      },
    );
  }

  TextFormField _buildDescriptionTextField() {
    return TextFormField(
      onSaved: (String value) {
        _description = value;
      },
      maxLines: 5,
      decoration: InputDecoration(labelText: "Enter Description"),
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return "Description is required and should be 10+ characters long";
        }
        return null;
      },
    );
  }

  TextFormField _buildPriceTextField() {
    return TextFormField(
      onSaved: (String value) {
        _price = double.parse(value);
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return "Price is required and should be a valid integer";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Enter Price", contentPadding: EdgeInsets.all(10.0)),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _title,
      'description': _description,
      'price': _price,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 10.0,
            ),
            SwitchListTile(
              title: Text("Accept Terms & Conditions"),
              value: _acceptTerms,
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Save', style: TextStyle(fontSize: 16.0)),
              onPressed: _submitForm,
            )
//          GestureDetector(
//            onTap: () => print("Hi"),
//            child: Container(
//              color: Colors.green,
//              padding: EdgeInsets.all(5.0),
//              child: Text('Button'),
//            ),
//          ),
          ],
        ),
      ),
    );
  }
}
