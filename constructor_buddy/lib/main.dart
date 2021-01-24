// import 'package:constructor_buddy/Page/Screens/Welcome/welcome_screen.dart';
// import 'package:constructor_buddy/constants.dart';
// import 'package:constructor_buddy/Page/Screens/Welcome/welcome_screen.dart';
import 'package:constructor_buddy/Page/Screens/Welcome/welcome_screen.dart';
import 'package:constructor_buddy/constants.dart';
// import 'package:constructor_buddy/src/popular_screen.dart';
import 'package:flutter/material.dart';

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
// // import 'package:constructor_buddy/constants.dart';
// // import 'package:constructor_buddy/src/config/route.dart';
// // import 'package:constructor_buddy/src/pages/mainPage.dart';
// // import 'package:constructor_buddy/src/pages/product_detail.dart';
// // import 'package:constructor_buddy/src/widgets/customRoute.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_ecommerce_app/src/config/route.dart';
// // import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
// // import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
// // import 'package:flutter_ecommerce_app/src/widgets/customRoute.dart';

// // void main() => runApp(MyApp());

// // class MyAppp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Constructor Buddy ',
// //       theme: AppTheme.lightTheme.copyWith(
// //         textTheme: GoogleFonts.muliTextTheme(
// //           Theme.of(context).textTheme,
// //         ),
// //       ),
// //       debugShowCheckedModeBanner: false,
// //       routes: Routes.getRoute(),
// //       onGenerateRoute: (RouteSettings settings) {
// //         if (settings.name.contains('detail')) {
// //           return CustomRoute<bool>(
// //               builder: (BuildContext context) => ProductDetailPage());
// //         } else {
// //           return CustomRoute<bool>(
// //               builder: (BuildContext context) => MainPage());
// //         }
// //       },
// //       initialRoute: "MainPage",
// //     );
// //   }
// // }
// import 'package:constructor_buddy/adddatawidget.dart';
// import 'package:constructor_buddy/caseslist.dart';
// import 'package:constructor_buddy/model/cases.dart';
// import 'package:constructor_buddy/services/api_service.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_restapi/adddatawidget.dart';
// import 'dart:async';
// // import 'package:flutter_restapi/models/cases.dart';
// // import 'package:flutter_restapi/services/api_service.dart';
// // import 'package:flutter_restapi/caseslist.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final ApiService api = ApiService();
//   List<Cases> casesList;

//   @override
//   Widget build(BuildContext context) {
//     if (casesList == null) {
//       casesList = List<Cases>();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: new Container(
//         child: new Center(
//             child: new FutureBuilder(
//           future: loadList(),
//           builder: (context, snapshot) {
//             return casesList.length > 0
//                 ? new CasesList(cases: casesList)
//                 : new Center(
//                     child: new Text('No data found, tap plus button to add!',
//                         // ignore: deprecated_member_use
//                         style: Theme.of(context).textTheme.title));
//           },
//         )),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _navigateToAddScreen(context);
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   Future loadList() {
//     Future<List<Cases>> futureCases = api.getCases();
//     futureCases.then((casesList) {
//       setState(() {
//         this.casesList = casesList;
//       });
//     });
//     return futureCases;
//   }

//   _navigateToAddScreen(BuildContext context) async {
//     // ignore: unused_local_variable
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddDataWidget()),
//     );
//   }
// }
