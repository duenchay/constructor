import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'models.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({this.product});
  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
         NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              leading: Container(),
              backgroundColor: Colors.grey[300],
              floating: true,
              snap: true,
              brightness: Brightness.light,
              pinned: false,
              expandedHeight: 339,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 60,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 44,
                              width: 44,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppTheme.black5,
                                borderRadius: BorderRadius.circular(
                                  44.0,
                                ),
                              ),
                              child: SvgPicture.asset(
                                "assets/images/chevronLeft.svg",
                              ),
                            ),
                          ),
                          // Expanded(child: Container()),
                          SizedBox(width: 10),
                      
                        ],
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 221,
                    //   child: Hero(
                    //     transitionOnUserGestures: true,
                    //     tag: product,
                    //     child: Image.asset(product.product_img),
                    //   ),
                    // ),
                    // SizedBox(width: 30),
                       Container(
                        //  width: double.infinity,
                        //   height: 100,
                          height: MediaQuery.of(context).size.height *
                              0.40,
                          width:
                              MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(product.product_img))),
                        ),
                  ],
                ),
              ),
            )
          ];
        },
                    
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          // child: BackdropFilter(
            // filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
                color: AppTheme.white,
                width: MediaQuery.of(context).size.width,
                child: Theme(
                  data: ThemeData(
                    platform: TargetPlatform.android,
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(
                      30.0,
                    ),
                    children: [
            
                      SizedBox(height: 30),
                      Row(
                        children: [
                        
                          SizedBox(width: 15),
                          Expanded(
                            child: GestureDetector(
                              // onTap: () {
                              //   BottomDialog.itemBuy(context, widget.itemModel);
                              // },
                                onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          //  product: product,
                                        )));
                          },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.red,
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                ),
                                height: 72,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                          //ปุ่มซื้อ
                                      children: [
                                        Text(
                                          "Buy",
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontDisplay,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            height: 1.4,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          "${product.product_price } บาท",
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontDisplay,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            height: 1.4,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      //ชื่อสินค้า
                      Text(
                      product.product_name,
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.18,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 10),
                       Text("${product.product_type}  ",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.18,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      
                      Text("รายละเอียดสินค้า : ",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      //รายละเอียดสินค้า
                      Row(
                        children: [
                         
                          Expanded(
                            child: Text(
                              product.product_detail,
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                )
                // child: ,
                )
                

                
          ),
        
         )
        ],

      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.purple[100],
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.purple[100],
      //   title: Text(product.product_name),
      // ),
      body: bodyWidget(context),
    ); 
  }
}
