// import 'dart:convert';

// import 'package:constructor_buddy/Page/type/Product.dart';
// import 'package:constructor_buddy/model/model.dart';
// // import 'package:constructor_buddy/pages/product.dart';
// // import 'package:constructor_buddy/pages/productDetail.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:flutter_app/animation/RotationRoute.dart';
// // import 'package:flutter_app/animation/ScaleRoute.dart';
// // import 'package:flutter_app/pages/FoodDetailsPage.dart';
// import 'package:http/http.dart' as http;
// class PopularFoodsWidget extends StatefulWidget {
//   @override
//   _PopularFoodsWidgetState createState() {
//    return new _PopularFoodsWidgetState();
//   }
//     static fromJson(data) {}
// }

// class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {

//   List<Product> _products = <Product>[];
//    @override
//   void initState() {
//     super.initState();
//     print('fetching data');
//     getProducts();
//     // getProductType();
//   }
//   void getProducts() async {
//     print('calling getProducts()');
//     String url = 'https://constructor.pythonanywhere.com/api/Product/';
//     // String url1 ='https://constructor.pythonanywhere.com/api/Product_Type/';
//     var response =
//         await http.get(url, headers: {'Content-Type': 'application/json'});
//         // await http.get(url1, headers: {'Content-Type': 'application/json'});
//     List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
//     _products = result.map<Product>((data) => Product.fromMap(data)).toList();
//     setState(() {});
//   }
//  Widget build(BuildContext context) {
//     return MaterialApp(
//     home:Scaffold(
//       backgroundColor: Colors.indigo[100],
//       appBar: AppBar(
//         title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                   Image.asset(
//                  'assets/icons/repair-tools.png',
//                   fit: BoxFit.contain,
//                   height: 32,
//               ),
//               Container(
//                   padding: const EdgeInsets.all(8.0), 
//                   child: Text('วัสดุ 3ก.',style: GoogleFonts.montserrat(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 27,))),
//             ],

//           ),
//         backgroundColor: Colors.indigo[300],

//       ),

//          body: Padding(
//            padding: EdgeInsets.all(10),
//            child: show()
         
         
//          ,),
//        )
              
      
//     );
//   }

// show(){
//   return ListView(
//     children : result.map((product) {
//       return Card(
//         child : ListTile(
//           title: Text(product.product_name),
//           // subtitle: Text(e['product']),
//           // leading: Text(e['product']),
//         )
//       );
//     }
//   ).toString()
//   );
// }




// }