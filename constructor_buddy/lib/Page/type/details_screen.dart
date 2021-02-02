// import 'package:constructor_buddy/Page/type/Product.dart';
import 'package:constructor_buddy/Page/type/Product.dart';
import 'package:constructor_buddy/Page/type/cat/body.dart';
// import 'package:constructor_buddy/Page/type/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/login.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/login.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/login.svg"),
          onPressed: () {},
        ),
        SizedBox(width: 20.0 / 2)
      ],
    );
  }
}
