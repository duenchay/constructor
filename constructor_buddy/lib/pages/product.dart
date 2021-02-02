import 'dart:convert';
import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/pages/dd.dart';
import 'package:constructor_buddy/pages/detail.dart';
import 'package:constructor_buddy/pages/productdetail.dart';
import 'package:constructor_buddy/src/app_theme.dart';
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


  @override
  void initState() {
    super.initState();
    print('fetching data');
    getProducts();
  }

  

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
  return MaterialApp(
      title: 'First Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
    // return Scaffold(
    //   backgroundColor: Colors.indigo[100],
    //   appBar: AppBar(
    //     title: Text("🐱 Breed"),
    //     backgroundColor: Colors.indigo[300],
    //   ),
      body: _products.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: _products
                  .map((product) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dd(
                                           product: product,
                                        )));
                          },
                          child: Hero(
                            tag: product.product_name,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.11,
                                    width:
                                        MediaQuery.of(context).size.width * 0.30,
                                    // decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //         fit: BoxFit.cover,
                                    //         image: NetworkImage(poke.img)
                                    //         )),
                                    
                                  ),
                                  Text(
                                    product.product_name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  
                                ],
                              ),
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                      )
                      )
                  .toList(),
            ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   print('update Users');
  //   //print('${_farmers}');
  //   return MaterialApp(
  //     title: 'First Example',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('User'),
  //       ),
  //       body: _users.isEmpty
  //           ? Center(
  //               child: CircularProgressIndicator(),
  //             )
  //           : Column(
  //               children: _users
  //                   .map((user) => Card(
  //                       child: ListTile(
  //                           leading: FlutterLogo(size: 62.0),
  //                           title: Text(user.username),
  //                           subtitle: Text(user.email),
  //                           trailing: Icon(Icons.more_vert),
  //                           isThreeLine: true,
  //                           onTap: () {
  //                             Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                     builder: (context) => UserDetail(
  //                                           user: user,
  //                                         )));
  //                           })))
  //                   .toList(),
  //             ),
  //     ),
  //   );
  // }
}
