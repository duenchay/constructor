import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/model/model.dart';
import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'models.dart';

class Detail extends StatelessWidget {
  final Product product;

  Detail({this.product});

  // bodyWidget(BuildContext context) => 
      Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: NestedScrollView(
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
                          Expanded(child: Container()),
                          // GestureDetector(
                          //   onTap: () {

                          //   },
                          //   child: Container(
                          //     height: 44,
                          //     width: 44,
                          //     padding: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //       color: AppTheme.white,
                          //       borderRadius: BorderRadius.circular(
                          //         44.0,
                          //       ),
                          //     ),
                          //     // child: SvgPicture.asset(
                          //     //   "assets/images/plus.svg",
                          //     // ),
                          //   ),
                          // ),
                          SizedBox(width: 10),
                          // GestureDetector(
                          //   onTap: () {
                          //     BottomDialog.itemSize(context);
                          //   },
                          //   child: Container(
                          //     height: 44,
                          //     width: 44,
                          //     padding: EdgeInsets.all(10),
                          //     decoration: BoxDecoration(
                          //       color: AppTheme.white,
                          //       borderRadius: BorderRadius.circular(
                          //         44.0,
                          //       ),
                          //     ),
                          //     child: SvgPicture.asset(
                          //       "assets/images/more.svg",
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 221,
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: product.product_name,
                        child: Image.asset(product.product_name),
                      ),
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
                                          "\$${product.product_name}",
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "or Bid",
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontText,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            height: 1.33,
                                            color:
                                                AppTheme.white.withOpacity(0.6),
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          "Highest Bid",
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontText,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            height: 1.33,
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
                      Text(
                        product.product_name,
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.18,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 20),
                      Text(
                        "Information",
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
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Style",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "487471-006",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Colorway",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "BLACK WHITE-OFF WHITE-GYM RED",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Retail Price",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "\$190",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Release Date",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "07/02/2020",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
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
                ),
          ),
        ),
    );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[50],
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.orange,
//         // title: Text(farmer.farmerName),
//       ),
//       body: bodyWidget(context),
//     );
  }
}