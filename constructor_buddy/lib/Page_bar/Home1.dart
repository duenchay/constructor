import 'package:constructor_buddy/Page_bar/Chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
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
           
          //  title: Text('วัสดุ 3ก.' , textAlign: TextAlign.center,style: GoogleFonts.montserrat(
          //         color: Colors.black,
          //         fontWeight: FontWeight.w400,
          //         fontSize: 27,
          //       ),),
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
              TextField(
                decoration: InputDecoration(
                    hintText: 'ค้นหา',
                    hintStyle: GoogleFonts.montserrat(color: Colors.black38),
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white, width: 3)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white, width: 0)),
                    filled: true,
                    fillColor: Colors.black.withAlpha(15)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Category',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'See All',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.14,
                child: ListView(
                  shrinkWrap: true,
                  itemExtent: 90,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Chat();
                                }));
                          },
                          child: Card(
                            color: Color(0xffFFE08E),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Padding(
                                //   padding: const EdgeInsets.fromLTRB(24, 18, 0, 0),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: <Widget>[
                                      // Text(
                                      //   'Orange',
                                      //   style: GoogleFonts.montserrat(
                                      //     fontWeight: FontWeight.w500,
                                      //     fontSize: 22,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   'Rs. 50/kg',
                                      //   style: GoogleFonts.montserrat(
                                      //     fontWeight: FontWeight.w400,
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,10,20,2),
                                child:
                                      Image(image: AssetImage('assets/settings.png')),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Positioned(
                        //   top: 170,
                        //   left: 92,
                        //   child: MaterialButton(
                        //     minWidth: 10,
                        //     onPressed: () {
                        //       print('Pressed');
                        //     },
                        //     color: Colors.white.withOpacity(0.6),
                        //     elevation: 0,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(0),
                        //             bottomRight: Radius.elliptical(40, 60),
                        //             topLeft: Radius.circular(15),
                        //             bottomLeft: Radius.circular(15))),
                        //     child: Icon(Icons.add,color: Color(0xffFFCC3F),),
                        //   ),
                        // ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Card(
                          color: Color(0xffFFE3E5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(24, 18, 0, 0),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Text(
                              //         'Apple',
                              //         style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 22,
                              //         ),
                              //       ),
                              //       Text(
                              //         'Rs. 90/kg',
                              //         style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,10,5,0),
                                child:
                                Image(image: AssetImage('assets/nails.png'),),
                              
                              ),
                              
                            ],
                          ),
                          
                        ),
                    //     Text(
                    //   'See All',
                    //   style: GoogleFonts.montserrat(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 15,
                    //   ),
                    // ),
                        // Positioned(
                        //   top: 170,
                        //   left: 92,
                        //   child: MaterialButton(
                        //     minWidth: 10,
                        //     onPressed: () {
                        //       print('Pressed');
                        //     },
                        //     color: Colors.white.withOpacity(0.8),
                        //     elevation: 0,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(0),
                        //             bottomRight: Radius.elliptical(40, 60),
                        //             topLeft: Radius.circular(15),
                        //             bottomLeft: Radius.circular(15))),
                        //     child: Icon(Icons.add,color: Colors.red.withAlpha(95),),
                        //   ),
                        // ),
                    //        Text(
                    //   'See All',
                    //   style: GoogleFonts.montserrat(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 10,
                    //   ),
                    // ),
                      ],
                      
                    ),
                    
                    Stack(
                      children: <Widget>[
                        Card(
                          color: Color(0xffE1F8D7),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(24, 18, 0, 0),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Text(
                              //         'Kiwi',
                              //         style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 22,
                              //         ),
                              //       ),
                              //       Text(
                              //         'Rs. 150/kg',
                              //         style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                // padding: const EdgeInsets.all(20),
                                padding: const EdgeInsets.fromLTRB(19,19,20,10),
                                child:
                                Image(image: AssetImage('assets/cement.png')),
                              ),
                            ],
                          ),
                        ),
                        // Positioned(
                        //   top: 170,
                        //   left: 92,
                        //   child: MaterialButton(
                        //     minWidth: 10,
                        //     onPressed: () {
                        //       print('Pressed');
                        //     },
                        //     color: Colors.white.withOpacity(0.8),
                        //     elevation: 0,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(0),
                        //             bottomRight: Radius.elliptical(40, 60),
                        //             topLeft: Radius.circular(15),
                        //             bottomLeft: Radius.circular(15))),
                        //     child: Icon(Icons.add,color: Colors.green.withAlpha(95),),
                        //   ),
                        // ),
                        
                      ],
                    ),
                     Stack(
                      children: <Widget>[
                        Card(
                          color: Color(0xffE1F8D7),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(24, 18, 0, 0),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Text(
                              //         'Kiwi',
                              //         style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w500,
                              //           fontSize: 22,
                              //         ),
                              //       ),
                              //       Text(
                              //         'Rs. 150/kg',
                              //         style: GoogleFonts.montserrat(
                              //           fontWeight: FontWeight.w400,
                              //           fontSize: 14,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                // padding: const EdgeInsets.all(20),
                                padding: const EdgeInsets.fromLTRB(19,19,20,10),
                                child:
                                Image(image: AssetImage('assets/cement.png')),
                              ),
                            ],
                          ),
                        ),
                        // Positioned(
                        //   top: 170,
                        //   left: 92,
                        //   child: MaterialButton(
                        //     minWidth: 10,
                        //     onPressed: () {
                        //       print('Pressed');
                        //     },
                        //     color: Colors.white.withOpacity(0.8),
                        //     elevation: 0,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(0),
                        //             bottomRight: Radius.elliptical(40, 60),
                        //             topLeft: Radius.circular(15),
                        //             bottomLeft: Radius.circular(15))),
                        //     child: Icon(Icons.add,color: Colors.green.withAlpha(95),),
                        //   ),
                        // ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ช่างรับเหมาก่อสร้าง',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    '',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black12),
                  ),
                ],
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
                        padding: const EdgeInsets.fromLTRB(4, 5, 5, 5),
                        child: Container(
                          width: width * 0.25,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlueAccent.withAlpha(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image(
                              image: AssetImage('assets/business-man.png'),
                            ),
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
                              'นายสมศักดิ์ ปานา',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                            // Text(
                            //  ' ขึ้นโครงบ้าน',
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
                                  ' ขึ้นโครงบ้าน',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // Icon(
                                //   Icons.location_on,
                                //   size: 12,
                                // ),
                                // Text(
                                //   ' 1.3km',
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
