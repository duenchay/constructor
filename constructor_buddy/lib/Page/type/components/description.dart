import 'package:constructor_buddy/Page/type/Product.dart';
import 'package:flutter/material.dart';
// import 'package:shop_app/models/Product.dart';

// import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
