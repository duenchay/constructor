// import 'package:constructor_buddy/Page/Screens/Welcome/welcome_screen.dart';
// import 'package:constructor_buddy/constants.dart';
import 'package:constructor_buddy/Page/Screens/Welcome/welcome_screen.dart';
import 'package:constructor_buddy/constants.dart';
import 'package:constructor_buddy/src/config/route.dart';
import 'package:constructor_buddy/src/pages/mainPage.dart';
import 'package:constructor_buddy/src/pages/product_detail.dart';
import 'package:constructor_buddy/src/widgets/customRoute.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/themes/theme.dart';
// // import 'package:mongo_dart/mongo_dart.dart';
// // import 'dart:io' show Platform;

// // String host = Platform.environment['127.0.0.1'] ;
// // String port = Platform.environment['27017'];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //  var db = Db('mongodb://$host:$port/mongo_dart-blog');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Constructor Buddy ',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
// import 'package:constructor_buddy/constants.dart';
// import 'package:constructor_buddy/src/config/route.dart';
// import 'package:constructor_buddy/src/pages/mainPage.dart';
// import 'package:constructor_buddy/src/pages/product_detail.dart';
// import 'package:constructor_buddy/src/widgets/customRoute.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/src/config/route.dart';
// import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
// import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
// import 'package:flutter_ecommerce_app/src/widgets/customRoute.dart';

// void main() => runApp(MyApp());

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constructor Buddy ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.contains('detail')) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => ProductDetailPage());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => MainPage());
        }
      },
      initialRoute: "MainPage",
    );
  }
}
