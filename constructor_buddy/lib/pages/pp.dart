import 'dart:convert';
// import 'dart:html';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/pages/productDetail.dart';
// import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Pps extends StatefulWidget {
  final int id;

  Pps(this.id);

  @override
  _PpsState createState() {
    print('creating state');
    return new _PpsState();
  }

  static fromJson(data) {}
}

class _PpsState extends State<Pps> {
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
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
    _products = result.map<Product>((data) => Product.fromMap(data)).toList();
    setState(() {});
  }


  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/icons/repair-tools.png',
                  fit: BoxFit.contain,
                  height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), 
                  child: Text('วัสดุ 3ก.',style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 27,))),

              
            ],

          ),
          //  flexibleSpace: FlexibleSpaceBar(
          //         centerTitle: true,
          //         title: Text("Contacts"),
          //       ),
        // title: Text("วัสดุก่อสร้าง"),
        // subtitle: 
        
        backgroundColor: Colors.indigo[300],
        
        
        
      ),
      
         
         body: _products.isEmpty
         
         // == null
             ? 
             Center(
              
                 child: CircularProgressIndicator(),
               
               )
           //  child : 
     
                    
           
                   
          : Container(
                         height: 170,
                         margin: EdgeInsets.only(
                           top: 12,
                         ),
                         
                   child :
                  ListView(
                     scrollDirection: Axis.horizontal,
                   
                     
                     

                     // crossAxisCount: 2,
                     children: _products
                         .map((product) => Padding(
                               padding: const EdgeInsets.all(2.0),
                               child: InkWell(
                                 onTap: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ProductDetail(
                                                 product: product,
                                               )));
                                             // Text("ta");
                                               // 
                                 },

                           child :  Container(
                                 width: 160,
                                 height: 100,
                                 margin: EdgeInsets.only(
                                   right: 7,
                                   left: 2,
                                 ),
                                 
                                 child: Hero(
                                   tag: 
                                   Text("ta"),
                                   
                                   child: Card(
                                     
                                     child: Column(
                                       mainAxisSize: MainAxisSize.max,
                                       mainAxisAlignment:
                                           MainAxisAlignment.spaceEvenly,
                                           
                                       children: <Widget>[
                                         // Text("ta"),
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
                                         // Text("ta"),
                                        
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
                               
                               ),
                             ))
                         .toList(),
                   ),
                    ),
       )
              
      
    );
  }





}