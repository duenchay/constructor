// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:constructor_buddy/Page/body.dart';
// import 'package:constructor_buddy/Page_bar/Mycart.dart';
import 'package:constructor_buddy/MyHome.dart';
import 'package:constructor_buddy/Page_bar/Chat.dart';
import 'package:constructor_buddy/Page_bar/Home1.dart';
// import 'package:constructor_buddy/Page_bar/Mycart.dart';
// import 'package:constructor_buddy/Page_bar/Home.dart';
import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/src/popular_screen.dart';
// import 'package:constructor_buddy/UI/home.dart';
// import 'package:constructor_buddy/main.dart';
import 'package:flutter/material.dart';



class BarNavy extends StatefulWidget {
  @override
  _BarNavyState createState() => _BarNavyState();
}
class _BarNavyState extends State<BarNavy> {

  int _selectedIndex = 0;
  final List<Widget> _children = 
  [
    // HomeScreen(),
    PopularScreen(),
    MyHomePage(),
    Chat(),
    Profile()
  ];
  PageController _pageController;
  void onTappedBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
// onItemSelected: (index) {
//           setState(() => _selectedIndex = index);
//           _pageController.jumpToPage(index);
//         },
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color(0xFF0000) ,
        
        backgroundColor: Colors.deepPurple[200],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: onTappedBar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('My Cart'),
            icon: Icon(Icons.shopping_cart_rounded )
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Chat'),
            icon: Icon(Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Me'),
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
    );
  }
}