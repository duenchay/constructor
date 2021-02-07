
import 'package:constructor_buddy/Page_bar/MyHome.dart';
import 'package:constructor_buddy/pages/mechanic.dart';
import 'package:constructor_buddy/pages/mechanicDetail.dart';
import 'package:constructor_buddy/pages/pp.dart';
import 'package:constructor_buddy/pages/product.dart';
import 'package:constructor_buddy/pages/pros.dart';
import 'package:constructor_buddy/pages/test.dart';
import 'package:constructor_buddy/src/popular_screen.dart';

import 'package:flutter/material.dart';



class BarNavy extends StatefulWidget {
  @override
  _BarNavyState createState() => _BarNavyState();
}
class _BarNavyState extends State<BarNavy> {

  int _selectedIndex = 0;
  final List<Widget> _children = 
  [

     MyHome(),
    Test(),
    Pps(1),
    // SearchScreen()
    // Ho(),
    Products(1),
    HomePage(),
    Mechanics(1),

    

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
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Me'),
            icon: Icon(Icons.account_circle_rounded),
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