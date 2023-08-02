import 'package:banao_t1/pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {

  int myIndex = 0;

  final tabs = [

    HomePage(),
    Center(child: Text('Learn'),),
    Center(child: Text('Hub'),),
    Center(child: Text('Chat'),),
    Center(child: Text('Profile'),),

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          myIndex = index;

        });
      },
      currentIndex: myIndex,
      selectedItemColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            // color: Colors.grey,
          ),
          label: 'Home',),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded , ),
          label: 'Learn',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hub_outlined,),
          label: 'Hub',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline_sharp,),
          label: 'Chat',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded,),
          label: 'Profile',
        ),
      ],
    );
  }

}