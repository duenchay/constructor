import 'dart:convert';
// import 'dart:html';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/pages/mechanic.dart';
import 'package:constructor_buddy/pages/mechanicDetail.dart';
import 'package:constructor_buddy/pages/productDetail.dart';
// import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Ppp extends StatefulWidget {
  final int id;

  Ppp(this.id);

  @override
  _PppState createState() {
    print('creating state');
    return new _PppState();
  }

  static fromJson(data) {}
}

class _PppState extends State<Ppp> {
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
      debugShowCheckedModeBanner: false,
    home :Scaffold(
      
      
      // backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title:
        // debugShowCheckedModeBanner: false,
         Row(
          
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
          

        backgroundColor: Colors.indigo[300],
        

      ),

         body: 

        Center(
        child: 
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
                 margin: EdgeInsets.only(
                   left: 29,
                   right: 29,
                   top: 15,
                 ),
                 child:
                  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text(
                   "วัสดุก่อสร้าง",
                   style: TextStyle(
                     // fontFamily: AppTheme.fontDisplay,
                     fontStyle: FontStyle.normal,
                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                     height: 1.4,
                     // color: AppTheme.black,
                   ),
                 ),
                  Text(
                   "See All",
                   style: TextStyle(
                     // fontFamily: AppTheme.fontDisplay,
                     fontStyle: FontStyle.normal,
                     fontWeight: FontWeight.bold,
                     fontSize: 15,
                     height: 1.4,
                     // color: AppTheme.black,
                   ),
                 ),
                  
                 ],
               ),
               ),

            // Expanded(
              Container(
                         height: 170,
                         margin: EdgeInsets.only(
                           top: 10,
                         ),
                 child:
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
                     Expanded(flex: 1, child: Mechanicss(1))
        
          ]
       )
              
        ),
        
    ),
   
    );
  }
}


// import 'dart:convert';
// // import 'package:constructor_buddy/Page_bar/Profile.dart';
// import 'package:constructor_buddy/model/model.dart';
// // import 'package:constructor_buddy/pages/productDetail.dart';
// import 'package:constructor_buddy/pages/mechanicDetail.dart';
// // import 'package:constructor_buddy/pages/detail.dart';
// // import 'package:constructor_buddy/pages/productdetail.dart';
// // import 'package:constructor_buddy/src/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'models.dart';
// import 'product_detail.dart';

class Mechanicss extends StatefulWidget {
  final int id;

  Mechanicss(this.id);

  @override
  _MechanicssState createState() {
    print('creating state');
    return new _MechanicssState();
  }

  static fromJson(data) {}
}

class _MechanicssState extends State<Mechanicss> {
  // var url = "https://jungqueue.pythonanywhere.com/api/farmer/1";

  // เอารายชื่อของ farmer มาทั้งหมด
  List<Mechanic> _mechanics = <Mechanic>[];
  

  @override
  void initState() {
    super.initState();
    print('fetching data');
    getMechanics();
  }

  /*
  void getFarmerInfo() async {
    print('calling getFarmerInfo(${widget.farmerId})');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    dynamic result = json.decode(utf8.decode(response.bodyBytes));
    print('stream is done.');
    print('${result}');
    Farmer farmer1 = Farmer.fromMap(result);
    print('${farmer1}');
    _farmer = farmer1;
    setState(() {});
  }
  fetchData() async {
    final Stream<Farmer> stream = await getFarmers();
    stream.listen((Farmer farmer) => setState(() => _farmer.add(farmer)));
  }
  */

  void getMechanics() async {
    print('calling getMechanics()');
    String url = 'https://constructor.pythonanywhere.com/api/Mechanic/';
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
    _mechanics = result.map<Mechanic>((data) => Mechanic.fromMap(data)).toList();
    setState(() {});
  }
  Widget build(BuildContext context) {
    
    //print('${_products}');
    return MaterialApp(
      title: 'Constructor Buddy ',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: Colors.grey[50],
        // appBar: AppBar(
        //   title: Text('ช่างรับเหมาก่อสร้าง'),
        //   backgroundColor: Colors.indigo[300],
        // ),
        
        body: _mechanics.isEmpty
            ? Center(
                // child: CircularProgressIndicator(),
              )
            : ListView(
                children: _mechanics
                    .map((mechanic) => Card(
                        child: ListTile(
                            leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage("${mechanic.avatar}"),
                backgroundColor: Colors.transparent,
              ),
                            title: Text("${mechanic.mechanic_fname} ${mechanic.mechanic_lname}"),
                            subtitle: Text("${mechanic.mechanic_type}"),
                            // trailing: Icon(Icons.more_vert),
                            
                            isThreeLine: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MechanicDetail(
                                            mechanic: mechanic,
                                          )));
                            })))
                    .toList(),
              ),
      ),
    );
  }
}
