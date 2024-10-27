import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/userapp/services/userpreferences/current_user.dart';
import 'package:my_app/userapp/pages/tabpages/homepage.dart';
import 'package:my_app/userapp/pages/tabpages/profile.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  final CurrentUser _currentUser=Get.put(CurrentUser());
  int indexbar = 0;
  List<Widget> pages = [
    const Homepage(),
   
    const Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState:(currentstate){
        _currentUser.getuserdata();
      },
      builder:(controler){
        return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexbar,
          onTap: (value) {
            setState(() {
              indexbar = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "account",
            ),
          ]),
          body:pages[indexbar],
    ); 
      }
      );
  }
}


/***/