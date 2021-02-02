import 'package:constructor_buddy/src/app_theme.dart';
import 'package:constructor_buddy/src/bloc/home_bloc.dart';
import 'package:constructor_buddy/src/home_item_model.dart';
import 'package:constructor_buddy/src/item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen>
    with AutomaticKeepAliveClientMixin<PopularScreen> {
  @override
  bool get wantKeepAlive => true;

  List<int> shimmer = [
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  @override
  void initState() {
    homeBloc.fetchAllHome();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      
       appBar:  AppBar(
           backgroundColor: Colors.deepPurple[200],
           centerTitle: true, 
           title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'assets/icons/repair-tools.png',
                  fit: BoxFit.contain,
                  height: 30,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), 
                  child: Text('วัสดุ 3ก.',
                  style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 27,)
                  )
                  )
            ],

          ),
         ),
      //  AppBar(
      //     title: Text('Home Page'),
      //   ),
      backgroundColor: AppTheme.white,
      body: StreamBuilder(
        stream: homeBloc.allHome,
        builder: (context, AsyncSnapshot<HomeItemModel> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 44,
              ),
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/img/img_banner.png"),
                //       fit: BoxFit.fitWidth,
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only( left: 25,right: 25,top: 30,),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // หมวดหมู่
                Container(
                  margin: EdgeInsets.only(
                    left: 29,
                    right: 29,
                    top: 20,
                    // 68,
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text(
                    "หมวดหมู่",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                
                  // Text(
                  //   "See All",
                  //   style: TextStyle(
                  //     fontFamily: AppTheme.fontDisplay,
                  //     fontStyle: FontStyle.normal,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 15,
                  //     height: 1.4,
                  //     color: AppTheme.black,
                  //   ),
                  // ),
                 ],
                ),
                ),
                Container(
                  height: 112,
                  margin: EdgeInsets.only(
                    top: 12,
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data.productType.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 29),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 72,
                        height: 112,
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  72,
                                ),
                                color: AppTheme.black5,
                              ),
                              child: Center(
                                  // child: Image.asset(
                                    
                                  //    snapshot.data.productType[index].image,
                                    
                                  // )
                                  // ),
                                child: SvgPicture.asset(
                                  snapshot.data.productType[index].image,
                                ),
                              ),
                            ),
                            Container(
                              width: 72,
                              child: Center(
                                child: Text(
                                  snapshot.data.productType[index].name,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    height: 1.33,
                                    color: AppTheme.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                top: 8,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // วัสดุก่อสร้าง
                Container(
                  margin: EdgeInsets.only(
                    left: 29,
                    right: 29,
                    top: 68,
                  ),
                  child: 
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                    "วัสดุก่อสร้าง",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                   Text(
                    "See All",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                    // Text(
                    //   'See All',
                    //   style: GoogleFonts.montserrat(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ],
                ),
                ),
                Container(
                  height: 234,
                  margin: EdgeInsets.only(
                    top: 12,
                  ),
                  child: ListView.builder(
                 
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 29),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemScreen(
                                itemModel: snapshot.data.recommended[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 234,
                          margin: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 23,
                                        left: 15,
                                      ),
                                      child: SvgPicture.asset(
                                        snapshot.data.recommended[index]
                                            .companyImage,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Hero(
                                        child: Image.asset(
                                          snapshot
                                              .data.recommended[index].image,
                                        ),
                                        tag: snapshot.data.recommended[index],
                                      ),
                                      height: 85,
                                      width: 120,
                                    ),
                                  ],
                                ),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: AppTheme.black5,
                                ),
                              ),
                              Container(
                                child: Text(
                                  snapshot.data.recommended[index].name,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    height: 1.33,
                                    color: AppTheme.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                width: 150,
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                              ),
                              Container(
                                child: Text(
                                  snapshot.data.recommended[index].type,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                    height: 1.45,
                                    color: AppTheme.black30,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                width: 150,
                                margin: EdgeInsets.only(
                                  top: 4,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$" +
                                      snapshot.data.recommended[index].price
                                          .toString(),
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 1.43,
                                    color: AppTheme.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                width: 150,
                                margin: EdgeInsets.only(
                                  top: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container( 
                  margin: EdgeInsets.only(
                    left: 29,
                    right: 29,
                    top: 68,
                  ),
                  child: Text(
                    "ช่างรับเหมาก่อสร้าง",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                ),
                Container(
                  height: 206,
                  margin: EdgeInsets.only(
                    top: 12,
                    bottom: 120,
                  ),
                  child: new GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.3,
                    padding: EdgeInsets.only(
                      left: 29,
                    ),
                    controller: new ScrollController(
                      keepScrollOffset: false,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.newHighest.map((ItemModel value) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemScreen(
                                itemModel: value,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: new EdgeInsets.only(
                            bottom: 15,
                            right: 15,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Container(
                                    child: Hero(
                                      child: Image.asset(
                                        value.image,
                                      ),
                                      tag: value,
                                    ),
                                    height: 50,
                                    width: 70,
                                  ),
                                ),
                                width: 88,
                                height: 88,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  color: AppTheme.black5,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 22,
                                      width: 24,
                                      margin: EdgeInsets.only(
                                        bottom: 4,
                                      ),
                                      child: SvgPicture.asset(
                                        value.companyImage,
                                      ),
                                    ),
                                    Text(
                                      value.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontText,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        height: 1.33,
                                        color: AppTheme.black,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      value.type,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontText,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11,
                                        height: 1.45,
                                        color: AppTheme.black30,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "\$" + value.price.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontText,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        height: 1.43,
                                        color: AppTheme.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: ListView(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 175,
              ),
              children: [
                Container(
                  height: 345,
                  margin: EdgeInsets.only(
                    left: 14,
                    right: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    color: AppTheme.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 29,
                    right: 222,
                    top: 68,
                  ),
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                Container(
                  height: 234,
                  margin: EdgeInsets.only(
                    top: 12,
                  ),
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 29),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: AppTheme.white,
                            ),
                          ),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(
                              top: 10,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: AppTheme.white,
                            ),
                            height: 28,
                          ),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(
                              top: 12,
                              right: 24,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: AppTheme.white,
                            ),
                            height: 18,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 29,
                    right: 222,
                    top: 44,
                  ),
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                Container(
                  height: 206,
                  margin: EdgeInsets.only(
                    top: 12,
                  ),
                  child: new GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.3,
                    padding: EdgeInsets.only(
                      left: 29,
                    ),
                    controller: new ScrollController(
                      keepScrollOffset: false,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: shimmer.map((int value) {
                      return Row(
                        children: [
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: AppTheme.white,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 22,
                                  width: 24,
                                  margin: EdgeInsets.only(
                                    bottom: 4,
                                    top: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(
                                      6,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 22,
                                  margin: EdgeInsets.only(
                                    bottom: 12,
                                    right: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(
                                      6,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  margin: EdgeInsets.only(
                                    right: 75,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(
                                      6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
