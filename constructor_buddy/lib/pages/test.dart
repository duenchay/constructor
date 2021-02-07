import 'dart:convert';

// import 'package:constructor_buddy/pages/mo.dart';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/pages/productDetail.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_listview_json/entities/product.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  // final int id;

  // Test(this.id);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  
  List<Product> _products = List<Product>();
  List<Product> _productList = List<Product>();

  


  Future<List<Product>> fetchProducts() async {
    String url = 'https://constructor.pythonanywhere.com/api/Product/';
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    
    var products = List<Product>();
    
    if (response.statusCode == 200) {
      var productsJson = json.decode(utf8.decode(response.bodyBytes));
      for (var productJson in productsJson) {
        products.add(Product.fromMap(productJson));
      }
    }
    return products;
  }

  @override
  void initState() {
    fetchProducts().then((value) {
      setState(() {
        _products.addAll(value);
        _productList = _products;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Flutter listview with json'),
        actions: <Widget>[
  IconButton(
    icon: Icon(
      Icons.search,
      semanticLabel: 'search',
    ),
    onPressed: () {
      print('Search button');
    },
  ),
  IconButton(
    icon: Icon(
      Icons.tune,
      semanticLabel: 'filter',
    ),
    onPressed: () {
      print('Filter button');
    },
     ),
    ],
        
      ),
     body: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (2 / 2),
                ),
                 itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _productlist(index-1);
        },
        itemCount: _productList.length+1
                ),
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      //     return index == 0 ? _searchBar() : _productlist(index-1);
      //   },
      //   itemCount: _productList.length+1,
      // )
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _productList = _products.where((product) {
              var productTitle = product.product_name.toLowerCase();
              return productTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
  
  _productlist(index) {
    return    Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    // product: 
                                  )));
                    },
                    child:
    
     
                              Hero(
                            tag: _productList[index].product_img,
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
                                            image: NetworkImage(_productList[index].product_img))),
                                  ),
                                  Text(
                                    _productList[index].product_name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                   Text("${_productList[index].product_price} บาท "),
                                ],
                                ), 
                              color: Colors.indigo[200],
                              ),
                          )
                        )
    );


  }
 
}
