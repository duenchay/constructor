import 'package:constructor_buddy/Page/Screens/Login/login_screen.dart';
import 'package:constructor_buddy/Page/Screens/Signup/signup_screen.dart';
import 'package:constructor_buddy/Page/Screens/Welcome/components/background.dart';
import 'package:constructor_buddy/Page/components/rounded_button.dart';
import 'package:flutter/material.dart';
// import 'package:ifightcovid19/constants.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:ifightcovid19/Screens/Login/login_screen.dart';
// import 'package:ifightcovid19/Screens/Signup/signup_screen.dart';
// import 'package:ifightcovid19/Screens/Welcome/components/background.dart';
// import 'package:ifightcovid19/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            RoundedButton(
              text: "แอดมิน",
              // color: kPrimaryLightColor,
              // textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
