import 'package:constructor_buddy/Page/Screens/Login/login_screen.dart';
// import 'package:constructor_buddy/Page/Screens/Signup/signup_screen.dart';
import 'package:constructor_buddy/Page/Screens/Welcome/components/background.dart';
import 'package:constructor_buddy/Page/components/rounded_button.dart';
import 'package:constructor_buddy/Page/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:my_project/constants.dart';
// import 'package:my_project/models.dart';
// import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  void fetching() async {

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var fetch = () async {
      print('fetching');
      String url = 'https://constructor.pythonanywhere.com/api/user/';
      var response =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('jsondecode: ${json.decode(response.body)}');
      List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
      print('utf8decode: $result');
      print('---convert to list of User---');
 
      List<User> users =
          result.map<User>((data) => User.fromMap(data)).toList();

      users.forEach((user) => print(user.toString()));
    };
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/repair-tools.svg",
              
              height: size.height * 0.25,
            ),
            // Text("3 ก. วัสดุ", ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "ผู้ใช้งาน",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "ช่าง",
              // color: kPrimaryLightColor,
              // textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // RoundedButton(
            //   text: "แอดมิน",
            //   // color: kPrimaryLightColor,
            //   // textColor: Colors.black,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
