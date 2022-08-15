
import 'package:blood_donate/pages/BloodRecipient/blood_recipient.dart';

import 'package:blood_donate/pages/BloodRequest/blood_request.dart';
import 'package:blood_donate/pages/Home/home_page.dart';
import 'package:blood_donate/pages/Profile/profile_page.dart';
import 'package:blood_donate/pages/before_donation/before_donation.dart';
import 'package:flutter/material.dart';



class Dashboard extends StatefulWidget {
  

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
   HomePage(),
  BloodRecipient(),
  BloodRequest(),
  ProfilePage(),
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 95, 85),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              
              BottomNavigationBarItem(
                
                  label: '.',
                  icon: ImageIcon(AssetImage('assets/images/home.png')),
                  // title: Text(
                  //   '.',
                  //   style: TextStyle(color: Colors.white, fontSize: 30),
                  // ),
                  backgroundColor: Color.fromARGB(255, 245, 95, 85)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/bloodbanks.png')),
                    label: '.',
                  // title: Text(
                  //   '.',
                  //   style: TextStyle(color: Colors.white, fontSize: 40),
                  // ),
                  backgroundColor: Color.fromARGB(255, 245, 95, 85)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/blooodbank.png')),
                    label: '.',
                  // title: Text(
                  //   '.',
                  //   style: TextStyle(color: Colors.white, fontSize: 40),
                  // ),
                  backgroundColor: Color.fromARGB(255, 245, 95, 85)),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/profile.png')),
                  label: '.',
                backgroundColor: Color.fromARGB(255, 245, 95, 85),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 0));
  }
}