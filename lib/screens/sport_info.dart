import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/colors.dart';
import 'package:sports_iiitd/services/models.dart';

class SportInfo extends StatelessWidget {
  final String SportName;
  SportInfo(this.SportName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
      height: MediaQuery.of(context).size.height,
      color: CustomColors.black,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(
              SportName.toUpperCase(),
              context,
              logo: true,
              goBack: true,
            ),
            SportDetailsScreen(),
          ],
        ),
      ),
    ));
  }
}

class SportDetails extends StatefulWidget {
  final String sportName;

  SportDetails({required this.sportName});
  @override
  State<SportDetails> createState() => _DetailsState();
}

class _DetailsState extends State<SportDetails> {
  final List<String> Coaches = ["Divyansu Mishra", "Sher Singh Kumar"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 53, 51, 51),
            ),
            child: Column(
              children: [
                Text(
                  "Coach",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Container(
                    child: ListView.builder(
                  itemCount: (Coaches.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(Coaches.elementAt(index * 2)),
                        if ((index * 2 + 1) < Coaches.length)
                          Text(Coaches.elementAt(index * 2 + 1)),
                      ],
                    );
                  },
                )),
                Text("" + (Coaches.length / 2).ceil().toString()),
              ],
            ),
          ),
          //     SizedBox(height: 20),
          //     Container(
          //       height: 50,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: Color.fromARGB(255, 53, 51, 51),
          //       ),
          //       child: Column(
          //         children: [
          //           Text(
          //             "Team Members : ",
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w600,
          //               fontSize: 18,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(height: 20),
          //     Container(
          //       height: 50,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: Color.fromARGB(255, 53, 51, 51),
          //       ),
          //       child: Column(
          //         children: [
          //           Text(
          //             "Coordinators : ",
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w600,
          //               fontSize: 18,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(height: 20),
          //     Container(
          //       height: 50,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: Color.fromARGB(255, 53, 51, 51),
          //       ),
          //       child: Column(
          //         children: [
          //           Text(
          //             "Events : ",
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w600,
          //               fontSize: 18,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
        ],
      ),
    );
  }
}

class SportDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Sport Image
          Image.asset(
            'assets/gallery/2.PNG', // Replace with the actual image URL
            height: 200.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),

          // Coaches Section
          SectionTitle(title: 'Coaches'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: CoachCard(name: 'Divyanshu Mishra')),
              Expanded(child: CoachCard(name: 'Sher Singh')),
            ],
          ),

          SizedBox(height: 16.0),

          // Team Players Section
          SectionTitle(title: 'Team Players'),
          // Use ListView.builder for a dynamic list of players
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PlayerCard(name: 'Vardaan (C)')),
              Expanded(child: PlayerCard(name: 'Sahil Sahu')),
              // Add more PlayerCard widgets as needed
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PlayerCard(name: 'Hemanth')),
              Expanded(child: PlayerCard(name: 'Aditya Prasad')),
              // Add more PlayerCard widgets as needed
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PlayerCard(name: 'Stanzin Gyalpo')),
              Expanded(child: PlayerCard(name: 'Antonio Pedro')),
              // Add more PlayerCard widgets as needed
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PlayerCard(name: 'Vardaan (C)')),
              Expanded(child: PlayerCard(name: 'Sahil Sahu')),
              // Add more PlayerCard widgets as needed
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PlayerCard(name: 'Hemanth')),
              Expanded(child: PlayerCard(name: 'Aditya Prasad')),
              // Add more PlayerCard widgets as needed
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: PlayerCard(name: 'Stanzin Gyalpo')),
              Expanded(child: PlayerCard(name: 'Antonio Pedro')),
              // Add more PlayerCard widgets as needed
            ],
          ),
          SizedBox(height: 16.0),

          // Coordinators Section
          SectionTitle(title: 'Coordinators'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: CoordinatorCard(name: 'Sahil Sahu')),
              Expanded(child: CoordinatorCard(name: 'Vardan Abrol')),
            ],
          ),

          SizedBox(height: 16.0),

          // Regular Practice Timings Section
          SectionTitle(title: 'Regular Practice Timings'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: PracticeTimingsCard(
                      day: 'Monday', time: '5:00 PM - 7:00 PM')),
              Expanded(
                  child: PracticeTimingsCard(
                      day: 'Wednesday', time: '7:00 AM - 9:00 AM')),
              // Add more PracticeTimingsCard widgets as needed
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CoachCard extends StatelessWidget {
  final String name;

  CoachCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Center(
            child: Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        )),
        // Add more information about the coach if needed
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final String name;

  PlayerCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // Add more information about the player if needed
      ),
    );
  }
}

class CoordinatorCard extends StatelessWidget {
  final String name;

  CoordinatorCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Center(
            child: Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        )),
        // Add more information about the coordinator if needed
      ),
    );
  }
}

class PracticeTimingsCard extends StatelessWidget {
  final String day;
  final String time;

  PracticeTimingsCard({required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Center(
            child: Text(
          day,
          style: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        )),
        subtitle: Center(
            child: Text(
          time,
          style: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        )),
        // Add more information about the practice timings if needed
      ),
    );
  }
}
