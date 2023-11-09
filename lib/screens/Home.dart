import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sports_iiitd/screens/equipments.dart';
import 'package:sports_iiitd/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of pages to be rendered
  final List<Widget> _children = [
    HomePage(),
    Container(
      color: Colors.blue,
    ),
    EquipmentScreen(),
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red.withOpacity(0.3),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0 ? Icon(IconlyBold.home) : Icon(IconlyLight.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 1 ? IconlyBold.discovery : IconlyLight.discovery),
            label: 'Events',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 2 ? IconlyBold.play : IconlyLight.play),
            label: 'Equipments',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 3 ? IconlyBold.profile : IconlyLight.profile),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Good ${goodWhat()} ${user!.displayName!.split(' ')[0]}!',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Discover ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Sports',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.red[800]),
            SizedBox(
              height: 10,
            ),
            Text(
              'Upcoming Events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: Colors.red[800]),
            SizedBox(
              height: 10,
            ),
            Text(
              'About Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: Colors.red[800]),
            SizedBox(
              height: 10,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: Colors.red[800]),
          ],
        ),
      ),
    );
  }
}

String goodWhat() {
  DateTime now = DateTime.now();
  if (now.hour < 12) {
    return 'Morning';
  } else if (now.hour < 16) {
    return 'Afternoon';
  } else {
    return 'Evening';
  }
}
