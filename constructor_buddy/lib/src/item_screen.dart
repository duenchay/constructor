import 'dart:ui';
 
import 'package:constructor_buddy/pages/productDetail.dart';
// import 'package:constructor_buddy/pages/productdetail.dart';
import 'package:constructor_buddy/src/app_theme.dart';
import 'package:constructor_buddy/src/bloc/home_bloc.dart';
// import 'package:constructor_buddy/src/bottom_dialog.dart';
// import 'package:constructor_buddy/src/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;
 
class ItemScreen extends StatefulWidget {
  ItemScreen({this.itemModel});

  final ItemModel itemModel; 

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final data = [
    new SalesData(1, 230),
    new SalesData(2, 230),
    new SalesData(3, 230),
    new SalesData(4, 225),
    new SalesData(5, 220),
    new SalesData(6, 218),
    new SalesData(7, 215),
    new SalesData(8, 210),
    new SalesData(9, 205),
    new SalesData(10, 200),
    new SalesData(11, 195),
    new SalesData(12, 190),
    new SalesData(13, 185),
    new SalesData(14, 180),
    new SalesData(15, 175),
    new SalesData(16, 175),
    new SalesData(17, 180),
    new SalesData(18, 185),
    new SalesData(19, 185),
    new SalesData(20, 185),
    new SalesData(21, 185),
    new SalesData(22, 190),
    new SalesData(23, 190),
    new SalesData(24, 190),
    new SalesData(25, 190),
    new SalesData(26, 195),
    new SalesData(27, 195),
    new SalesData(28, 195),
    new SalesData(29, 195),
    new SalesData(30, 200),
  ];

  // ignore: unused_element
  _getSeriesData() {
    List<charts.Series<SalesData, int>> series = [
      charts.Series(
        id: "Sales",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.sales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.blue.shadeDefault,
      )
    ];
    return series;
  }
 
  @override
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
                          // Expanded(child: Container()),
                          // SizedBox(width: 10),
                      
                        ],
                      ),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 221,
                    //   child: Hero(
                    //     transitionOnUserGestures: true,
                    //     tag: widget.itemModel,
                    //     child: Image.asset(widget.itemModel.image),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ];
        },
        body: ClipRRect(
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(24),
          //   topRight: Radius.circular(24),
          // ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
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
                                    builder: (context) => ProductDetail(
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
                                          "\$${widget.itemModel.price}",
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
                        widget.itemModel.name,
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
      ),
    );
  }
}

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}
