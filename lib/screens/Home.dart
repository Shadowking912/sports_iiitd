import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/dateUtil.dart';
import 'package:sports_iiitd/screens/equipments.dart';
import 'package:sports_iiitd/screens/history.dart';
import 'package:sports_iiitd/screens/profile.dart';
import 'package:sports_iiitd/screens/sg.dart';
import 'package:sports_iiitd/screens/view_events.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:sports_iiitd/services/db.dart';

import '../common/colors.dart';
import '../services/models.dart';
import 'events.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of pages to be rendered
  final List<Widget> _children = [
    HomePage(),
    Events(),
    EquipmentScreen(),
    SGs(),
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
                _currentIndex == 4 ? IconlyBold.folder : IconlyLight.folder),
            label: 'SGs',
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
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
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
                Text('Good ${goodWhat()} ${user!.displayName!.split(' ')[0]}!',
                    style: GoogleFonts.poppins(
                        color: CustomColors.white.withOpacity(0.6),
                        fontSize: 16)),
                Image.asset(
                  'assets/sportscouncil_logo.png',
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Discover ',
                  style: GoogleFonts.poppins(
                    color: CustomColors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Sports',
                  style: GoogleFonts.poppins(
                    color: CustomColors.red,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Info and Event Updates!',
                  style: GoogleFonts.poppins(
                    color: CustomColors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 193, 169, 109),
                      imagePath: "assets/sports_icons/maki_soccer.png",
                      sportsName: "Football",
                      sportsDetail: "Spectacular goals & football fever!"),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 171, 52, 59),
                      imagePath: "assets/sports_icons/maki_basketball.png",
                      sportsName: "Basketball",
                      sportsDetail: "Dunk into excitement!"),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 171, 52, 59),
                      imagePath: "assets/sports_icons/maki_swimming.png",
                      sportsName: "Swimming",
                      sportsDetail: "Laps, dives and swimming waves."),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 193, 169, 109),
                      imagePath: "assets/sports_icons/cricket.png",
                      sportsName: "Cricket",
                      sportsDetail: "Wickets fall, runs rise in cricket buzz"),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 193, 169, 109),
                      imagePath: "assets/sports_icons/maki_soccer.png",
                      sportsName: "Lawn Tennis",
                      sportsDetail: "Aces, serves and tennis flairs!"),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 171, 52, 59),
                      imagePath: "assets/sports_icons/maki_basketball.png",
                      sportsName: "Badminton",
                      sportsDetail: "Shuttles, rallies, badminton action!"),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 171, 52, 59),
                      imagePath: "assets/sports_icons/maki_swimming.png",
                      sportsName: "Squash",
                      sportsDetail: "Rallies, volleys, squash intensity!"),
                  sportsInfoTile(
                      blockColor: Color.fromARGB(255, 193, 169, 109),
                      imagePath: "assets/sports_icons/cricket.png",
                      sportsName: "Table Tennis",
                      sportsDetail: "Ping-pong finesse, rapid rallies!"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Upcoming Events',
              style: GoogleFonts.poppins(
                color: CustomColors.white,
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(
              color: CustomColors.red,
              endIndent: 140,
            ),
            UpcomingEvents(),
            Text(
              'About Us',
              style: GoogleFonts.poppins(
                color: CustomColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(
              color: CustomColors.red,
              endIndent: 250,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: ExpandableText(
                aboutUs(),
                expandText: "Read More",
                collapseText: "Read Less",
                style: GoogleFonts.poppins(
                    color: Color(0xb2ffffff),
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3),
                maxLines: 4,
                linkColor: Color.fromARGB(255, 146, 35, 39),
              ),
            ),
            Text(
              'Gallery',
              style: GoogleFonts.poppins(
                color: CustomColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(
              color: CustomColors.red,
              endIndent: 270,
            ),
            Gallery(),
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

Container sportsInfoTile(
    {required Color blockColor,
    required String imagePath,
    required String sportsName,
    required String sportsDetail}) {
  return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 134,
      height: 176,
      decoration: BoxDecoration(
        color: blockColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 62,
                    height: 62,
                    color: CustomColors.white,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    sportsName,
                    style: GoogleFonts.poppins(
                        color: CustomColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    sportsDetail,
                    style: GoogleFonts.poppins(
                      color: CustomColors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: 7,
          ),
          InkWell(
            onTap: () {
              print('Read more clicked');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Read more',
                  style: GoogleFonts.poppins(
                    color: CustomColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: CustomColors.black,
                  size: 14,
                ),
              ],
            ),
          )
        ],
      ));
}

class UpcomingEvents extends StatefulWidget {
  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLatestEvents(2),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              for (Event event in snapshot.data as List<Event>)
                eventTile(event, user!.uid),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: CustomColors.red,
          ),
        );
      },
    );
  }
}

Container eventTile(Event event, String uid) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // width: 100,
          padding: EdgeInsets.fromLTRB(6, 3, 0, 3),
          margin: EdgeInsets.fromLTRB(0, 7, 5, 0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(
              color: Color.fromARGB(
                  255, 66, 27, 29), // Set the color of the left border
              width: 2, // Set the width of the left border
            ),
          )),
          child: Text(
            getDayWithDate(event.date),
            style: GoogleFonts.poppins(
              fontSize: 9,
              fontWeight: FontWeight.w400,
              color: CustomColors.white,
              letterSpacing: 0.2,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: 265,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 66, 27, 29),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name + ' - ' + event.sport,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ExpandableText(
                event.description,
                expandText: "Read More",
                collapseText: "Read Less",
                style: GoogleFonts.poppins(
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xb2ffffff),
                ),
                linkColor: CustomColors.black,
                maxLines: 3,
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: event.participants.contains(uid)
                        ? null
                        : () async {
                            await registerForEvent(event);
                          },
                    child: Container(
                      width: 80,
                      height: 22,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: event.participants.contains(uid)
                              ? CustomColors.red.withOpacity(0.3)
                              : CustomColors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          event.participants.contains(uid)
                              ? 'Registered'
                              : 'Register',
                          style: GoogleFonts.poppins(
                              fontSize: 7.5, color: CustomColors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      getReadableTime(event.date),
                      style: GoogleFonts.poppins(
                          fontSize: 9,
                          color: CustomColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class Gallery extends StatelessWidget {
  final List<String> eventImages = [
    'assets/gallery/1.PNG',
    'assets/gallery/2.PNG', // Replace with actual image paths
    'assets/gallery/3.PNG',
    'assets/gallery/4.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: eventImages.map((imagePath) {
        return Container(
          margin:
              EdgeInsets.symmetric(vertical: 4), // Add spacing between images
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(
              imagePath,
              width: double.infinity, // Adjust the width as needed
              height: 200.0, // Adjust the height as needed
              fit: BoxFit.cover, // Adjust the BoxFit as needed
            ),
          ),
        );
      }).toList(),
    );
  }
}

String aboutUs() {
  return "At Sports Council, we're on a mission to amp up the sports culture at IIITD! 🚀 From epic intra-college tournaments like Karwaan, Desi-Adda and IPPL to our amazing inter-college sports fest - ASTRA, we're all about unleashing your athletic prowess. \n\nOffering self-growth courses in 10+ sports, we're not just playing; we're leveling up! Managing 15+ sports in the college campus, we keep the adrenaline pumping. Join us—where sports meet cool and self-growth is the game! 🏆🔥💪 \n\n#IIITDSportsCulture #GameOn #AthleticsEdge";
}
