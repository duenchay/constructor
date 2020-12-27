// import 'package:constructor_buddy/Main1.dart';
import 'package:constructor_buddy/Page/Screens/Signup/components/background.dart';
import 'package:constructor_buddy/Page/components/already_have_an_account_acheck.dart';
import 'package:constructor_buddy/Page/components/rounded_button.dart';
import 'package:constructor_buddy/Page/components/rounded_input_field.dart';
import 'package:constructor_buddy/Page/components/rounded_password_field.dart';
// import 'package:constructor_buddy/Page_bar/Home.dart';
import 'package:constructor_buddy/main.dart';
// import 'package:constructor_buddy/Page_bar/Home.dart';
// import 'package:constructor_buddy/bar/navy_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            RoundedInputField(
              hintText: "UserName",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "เข้าสู่ระบบ",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyAppp();
                      },
                    ),
                  );
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyAppp();
                    },
                  ),
                );
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
