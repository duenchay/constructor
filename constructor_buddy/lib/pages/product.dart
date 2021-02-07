import 'dart:convert';
// import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/pages/productDetail.dart';
// import 'package:constructor_buddy/pages/detail.dart';
// import 'package:constructor_buddy/pages/productdetail.dart';
// import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'models.dart';
// import 'farmer_detail.dart';

class Products extends StatefulWidget {
  final int id;

  Products(this.id);

  @override
  _ProductsState createState() {
    print('creating state');
    return new _ProductsState();
  }

  static fromJson(data) {}
}

class _ProductsState extends State<Products> {
  // var url = "https://constructor.pythonanywhere.com/api/Product/";
  // var url1 = "https://constructor.pythonanywhere.com/api/Product_Type/1/";

  List<Product> _products = <Product>[];
  // ignore: unused_field
  // List<Product_Type> _productTypes = <Product_Type>[];


  @override
  void initState() {
    super.initState();
    print('fetching data');
    getProducts();
    // getProductType();
  }

  //  void getProductType() async {
  //   print('calling getProducts()');
  //   // String url = 'https://constructor.pythonanywhere.com/api/Product/';
  //   String url ='https://constructor.pythonanywhere.com/api/Product_Type/';
  //   var response =
  //       await http.get(url, headers: {'Content-Type': 'application/json'});
  //       // await http.get(url1, headers: {'Content-Type': 'application/json'});
  //   List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
  //   _productTypes = result.map<Product_Type>((data) => Product_Type.fromMap(data)).toList();
  //   setState(() {});
  // }

  void getProducts() async {
    print('calling getProducts()');
    String url = 'https://constructor.pythonanywhere.com/api/Product/';
    // String url1 ='https://constructor.pythonanywhere.com/api/Product_Type/';
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
        // await http.get(url1, headers: {'Content-Type': 'application/json'});
    List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
    _products = result.map<Product>((data) => Product.fromMap(data)).toList();
    setState(() {});
  }
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text("วัสดุก่อสร้าง"),
        backgroundColor: Colors.indigo[300],
      ),
      body: _products == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: _products
                  .map((product) => 
                  Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                          product: product,
                                        )));
                          },
                          child: Hero(
                            tag: product.product_img,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(product.product_img))),
                                  ),
                                  Text(
                                    product.product_name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                   Text("${product.product_price} บาท "),
                                ],
                                ), 
                              color: Colors.indigo[200],
                              ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    
    );
  }
}




//  @override
//       Widget build(BuildContext context) {
//         return Scaffold(
//             appBar: new AppBar(),
//             body: CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: SizedBox(
//                     height: 100,
//                     child: ListView.builder(
//                         itemExtent: 150,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) => Container(
//                               margin: EdgeInsets.all(5.0),
//                               color: Colors.orangeAccent,
//                             ),
//                         itemCount: 20),
//                   ),
//                 ),
//                 // SliverGrid(
//                 //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 //     crossAxisCount: 2,
//                 //     childAspectRatio: 1.5,
//                 //   ),
//                 //   delegate: SliverChildBuilderDelegate(
//                 //     (context, index) => Container(
//                 //           margin: EdgeInsets.all(5.0),
//                 //           color: Colors.yellow,
//                 //         ),
//                 //   ),
//                 // )
//               ],
//             ));
//       }