import 'package:constructor_buddy/Page/Screens/Login/components/background.dart';
import 'package:constructor_buddy/Page/components/already_have_an_account_acheck.dart';
import 'package:constructor_buddy/Page/components/rounded_button.dart';
import 'package:constructor_buddy/Page/components/rounded_input_field.dart';
import 'package:constructor_buddy/Page/components/rounded_password_field.dart';
// import 'package:constructor_buddy/Page_bar/Home.dart';
import 'package:constructor_buddy/bar/navy_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = '';
  String password = '';

   void postToServer() async {
    var url = 'https://constructor.pythonanywhere.com/api/user/';
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "ลงทะเบียนเข้าใช้งาน",
            //   style: TextStyle(fontWeight: FontWeight.bold),
              //ตัวเข้ม style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)
            // ),
            // SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            SizedBox(height: size.height * 0.03),
             RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                this.email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                // ignore: unnecessary_brace_in_string_interps
                print('เปลี่ยนค่า password: ${value}');
                this.password = value;
              },
            ),
            // RoundedPasswordField(
            // onChanged: (value) {},
            // //  ),
            RoundedButton(
              text: "ตกลง",
              press: () {
                print('พยายาม login: ด้วย ${this.email} ${this.password}');
                postToServer();
                
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BarNavy();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BarNavy();
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
