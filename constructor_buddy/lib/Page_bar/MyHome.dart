// import 'package:constructor_buddy/Page/type/categorries.dart';
import 'package:constructor_buddy/Page_bar/Chat.dart';
import 'package:constructor_buddy/pages/pp.dart';
import 'package:constructor_buddy/src/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
      appBar: PreferredSize(
        // title: Text('Home Page'), 
        // backgroundColor: Colors.orangeAccent,
        preferredSize: Size.fromHeight(50.0),
         child: AppBar(
          //  backgroundColor: Colors.indigo[300],
           backgroundColor: Colors.deepPurple[200],
           centerTitle: true, 
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
                  fontSize: 27,)))
            ],

          ),
         ),
        ),
      
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       Icon(Icons.menu),
              //       Icon(Icons.shopping_cart)
              //     ],
              //   ),
              // ),
              // Text(
              //   'Hey Alex,',
              //   style: GoogleFonts.montserrat(
              //     fontWeight: FontWeight.w600,
              //     fontSize: 30,
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.025,
              // ),
              // Text(
              //   'Find fresh fruits for your family',
              //   style: GoogleFonts.montserrat(
              //     color: Colors.black45,
              //     fontWeight: FontWeight.w400,
              //     fontSize: 20,
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.05,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //       hintText: 'ค้นหา',
              //       hintStyle: GoogleFonts.montserrat(color: Colors.black38),
              //       prefixIcon: Icon(Icons.search),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(50),
              //           borderSide: BorderSide(color: Colors.white, width: 3)),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(50),
              //           borderSide: BorderSide(color: Colors.white, width: 0)),
              //       filled: true,
              //       fillColor: Colors.black.withAlpha(15)),
              // ),
                // หมวดหมู่
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 29,
                    top: 25,
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
              
              // SizedBox(
                // height: height * 0.14,
                 Container(
                  height: 112,
                  margin: EdgeInsets.only(
                    top: 12,
                  ),
                 child: ListView(
                  shrinkWrap: true,
                  itemExtent: 90,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //  1
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Chat();
                                }));
                          },
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
                               child: SvgPicture.asset('assets/images/a2.svg'),
                             ),
                            ),
                            Container(
                              width: 72,
                              child: Center(
                                child: Text(
                                  'วัสดุเทพื้น',
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
                        ),
                      ],
                    ),
                      // 2
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Chat();
                                }));
                          },
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
                               child: SvgPicture.asset('assets/images/a3.svg'),
                             ),
                            ),
                            Container(
                              width: 72,
                              child: Center(
                                child: Text(
                                  'ปูน',
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
                        ),
                      ],
                    ),
                      // 3
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Chat();
                                }));
                          },
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
                               child: SvgPicture.asset('assets/images/a4.svg'),
                             ),
                            ),
                            Container(
                              width: 72,
                              child: Center(
                                child: Text(
                                  'ท่อ',
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
                        ),
                      ],
                    ),
                    //  5
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Chat();
                                }));
                          },
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
                               child: SvgPicture.asset('assets/images/a5.svg'),
                             ),
                            ),
                            Container(
                              width: 72,
                              child: Center(
                                child: Text(
                                  'เสา',
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
                        ),
                      ],
                    ),
                      // 6
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Chat();
                                }));
                          },
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
                               child: SvgPicture.asset('assets/images/a6.svg'),
                             ),
                            ),
                            Container(
                              width: 72,
                              child: Center(
                                child: Text(
                                  'อิฐ',
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
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              // ),
                //  Categories(),
                
              SizedBox(
                height: height * 0.05,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     Text(
              //       'ช่างรับเหมาก่อสร้าง',
              //       style: GoogleFonts.montserrat(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 22,
              //       ),
              //     ),
              //     Text(
              //       '',
              //       style: GoogleFonts.montserrat(
              //           fontWeight: FontWeight.w500,
              //           fontSize: 15,
              //           color: Colors.black12),
              //     ),
              //   ],
              // ),
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
              // Pps()

            
               











             Container(
                  margin: EdgeInsets.only(
                    left: 10,
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
               
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: width * 0.25,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlueAccent.withAlpha(25),
                          ),
                          child: Image(
                            image: AssetImage('assets/business-man.png'),
                          ),
                          
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'นายสมชาย ทรงเอ',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                            // Text(
                            //   '9:00 - 10:00',
                            //   style: GoogleFonts.montserrat(
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 18,
                            //       color: Colors.black26),
                            // ),
                            
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 12,
                                ),
                                Text(
                                  'รับเหมาสร้างบ้าน',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 12,
                                ),
                                // Text(
                                //   ' 1.5km',
                                //   style: GoogleFonts.montserrat(
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: width * 0.25,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlueAccent.withAlpha(25),
                          ),
                          child: Image(
                            image: AssetImage('assets/business-man.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'นายสมชาย ทรงเอ',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                            // Text(
                            //   '9:00 - 10:00',
                            //   style: GoogleFonts.montserrat(
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 18,
                            //       color: Colors.black26),
                            // ),
                            
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 12,
                                ),
                                Text(
                                  'รับเหมาสร้างบ้าน',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 12,
                                ),
                                // Text(
                                //   ' 1.5km',
                                //   style: GoogleFonts.montserrat(
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: width * 0.25,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlueAccent.withAlpha(25),
                          ),
                          child: Image(
                            image: AssetImage('assets/business-man.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'นายสมชาย ทรงเอ',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                            // Text(
                            //   '9:00 - 10:00',
                            //   style: GoogleFonts.montserrat(
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 18,
                            //       color: Colors.black26),
                            // ),
                            
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 12,
                                ),
                                Text(
                                  'รับเหมาสร้างบ้าน',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 12,
                                ),
                                // Text(
                                //   ' 1.5km',
                                //   style: GoogleFonts.montserrat(
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    ),

  );
}
}
