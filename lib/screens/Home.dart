import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/screens/equipments.dart';
import 'package:sports_iiitd/screens/history.dart';
import 'package:sports_iiitd/screens/profile.dart';

import '../common/colors.dart';

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
    History(),
    EquipmentScreen(),
    MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.red.withOpacity(0.3),
        selectedItemColor: CustomColors.red,
        unselectedItemColor: CustomColors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Icon(IconlyBold.home)
                : Icon(IconlyLight.home),
            label: 'Home',
            backgroundColor: CustomColors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 1
                ? IconlyBold.discovery
                : IconlyLight.discovery),
            label: 'Events',
            backgroundColor: CustomColors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 2 ? IconlyBold.play : IconlyLight.play),
            label: 'Equipments',
            backgroundColor: CustomColors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _currentIndex == 3 ? IconlyBold.profile : IconlyLight.profile),
            label: 'Profile',
            backgroundColor: CustomColors.black,
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
  //User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 60, 4, 0),
      height: MediaQuery.of(context).size.height,
      color: CustomColors.black,
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
                  //'Good ${goodWhat()} ${user!.displayName!.split(' ')[0]}!',
                  "IIITD SPORTS",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 26,
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
                    color: CustomColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Sports',
                  style: TextStyle(
                    color: CustomColors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    // autogroupam9un7M (Y2Nkf18tQBB8LVVXFoAm9u)
                    padding:
                        EdgeInsets.fromLTRB(13 * 4, 18 * 4, 26 * 4, 17 * 4),
                    width: 40 * 4,
                    decoration: BoxDecoration(
                      color: Color(0xffc1a86c),
                      borderRadius: BorderRadius.circular(8 * 4),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3fc1a96d),
                          offset: Offset(5 * 2, 2 * 4),
                          blurRadius: 10 * 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // autogroupam9un7M (Y2Nkf18tQBB8LVVXFoAm9u)
                    padding:
                        EdgeInsets.fromLTRB(13 * 4, 18 * 4, 26 * 4, 17 * 4),
                    width: 40 * 4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 83, 83),
                      borderRadius: BorderRadius.circular(8 * 4),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(60, 255, 61, 27),
                          offset: Offset(5 * 2, 2 * 4),
                          blurRadius: 10 * 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // autogroupam9un7M (Y2Nkf18tQBB8LVVXFoAm9u)
                    padding:
                        EdgeInsets.fromLTRB(13 * 4, 18 * 4, 26 * 4, 17 * 4),
                    width: 40 * 4,
                    decoration: BoxDecoration(
                      color: Color(0xffc1a86c),
                      borderRadius: BorderRadius.circular(8 * 4),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3fc1a96d),
                          offset: Offset(5 * 2, 2 * 4),
                          blurRadius: 10 * 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // autogroupam9un7M (Y2Nkf18tQBB8LVVXFoAm9u)
                    padding:
                        EdgeInsets.fromLTRB(13 * 4, 18 * 4, 26 * 4, 17 * 4),
                    width: 40 * 4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 83, 83),
                      borderRadius: BorderRadius.circular(8 * 4),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(60, 255, 61, 27),
                          offset: Offset(5 * 2, 2 * 4),
                          blurRadius: 10 * 4,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      
                      Text(
                        // footballa4b (39:97)
                        'Football',
                        style:  TextStyle (
                          fontSize:  14*2,
                          fontWeight:  FontWeight.w600,
                          height:  1.5*2/2,
                          color:  Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Upcoming Events',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: CustomColors.red),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogrouphakdyiB (Y2Nnacbaf5ZsPiAiJuhaKd)
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                    height: double.infinity,
                    child: SizedBox(
                      child: Container(
                        child: Text(
                          'Tuesday\nAugust 15th',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupvzsd1Py (Y2NnDdCZ9SXqsfxVfnvzsD)
                    padding: EdgeInsets.all(12),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0x4fab343b),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          // intrafootballcompetition6gK (39:128)
                          Text(
                            'Intra Football Competition',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        
                        Container(
                          // loremipsumdolorsitametconsecte (39:129)
                          margin:
                              EdgeInsets.fromLTRB(0 * 2, 0 * 2, 4 * 2, 12 * 2),
                          constraints: BoxConstraints(
                          ),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis finibus tristique ultricies.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 7 * 2,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * 2 / 2,
                              color: Color(0xb2ffffff),
                            ),
                          ),
                        ),
                        Container(
                          // autogroup4xcftMH (Y2NnLCqvZh8mkHdmbn4XcF)
                          width: double.infinity,
                          height: 2 * 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupytbuER9 (Y2NnQTDr36Wb1LqugXYtBu)
                                margin: EdgeInsets.fromLTRB(
                                    0 * 2, 0 * 2, 9 * 2, 0 * 2),
                                width: 7 * 2,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff7e141a),
                                  borderRadius: BorderRadius.circular(2 * 20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Read More',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 7 * 2,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * 2 / 2,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                // pm900pmH8X (39:130)
                                '7:00 PM - 9:00 PM',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 8 * 2,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5 * 2 / 2,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'About Us',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: CustomColors.red),
            SizedBox(
              height: 10,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: CustomColors.red),
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
