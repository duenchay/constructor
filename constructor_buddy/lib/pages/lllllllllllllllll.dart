import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../main.dart';
// import '../navbar.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final formKey = GlobalKey<FormState>();

  // Map data = {'name': String, 'email': String, 'age': int};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Navbar(),
      appBar: AppBar(title: Text('Change Account Details')),
      body: Center(
        child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  // onSaved: (input) => data['name'] = input,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  // onSaved: (input) => data['email'] = input,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  // onSaved: (input) => data['age'] = input,
                ),
                FlatButton(
                  onPressed: () => formKey.currentState.save(),
                  child: Text('Submit'),
                  color: Colors.blue,
                  textColor: Colors.white,
                )
              ]),
        ),
      )),
    );
  }
}