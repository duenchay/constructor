import 'package:constructor_buddy/Page/details/details_screen.dart';
import 'package:constructor_buddy/Page/item.dart';
import 'package:constructor_buddy/Page/product.dart';
// import 'package:constructor_buddy/Page_bar/Chat.dart';
import 'package:flutter/material.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/screens/details/details_screen.dart';
// import 'package:flutter_svg/svg.dart';
import 'categorries.dart';
// import 'item_card.dart';
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Body(),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: IconButton(
//         icon: SvgPicture.asset("assets/cart.svg"),
//         onPressed: () {},
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: SvgPicture.asset(
//             "assets/cart.svg",
//             // By default our  icon color is white
//             color: Colors.black,
//           ),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: SvgPicture.asset(
//             "assets/cart.svg",
//             // By default our  icon color is white
//             color: Colors.black,
//           ),
//           onPressed: () {},
//         ),
//         SizedBox(width: 20 / 2)
//       ],
//     );
//   }
// }

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SafeArea(
            child: Text(
              " ",
              // "Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}
