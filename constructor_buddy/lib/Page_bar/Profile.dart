
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Example',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Home Page'),
        // ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
 

