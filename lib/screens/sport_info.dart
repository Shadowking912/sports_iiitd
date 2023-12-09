import 'dart:math';

import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/colors.dart';

class Sport extends StatelessWidget {
  String SportName;
  Sport(this.SportName);
  @override
  Widget build(BuildContext context) {
    // var SportName;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar(
              SportName.toUpperCase(),
              context,
              logo: true,
              goBack: true,
            ),
            SportDetails(sportName: SportName),
          ],
        ),
      ),
    );
  }
}

class SportDetails extends StatefulWidget {
  final String sportName;
  SportDetails({required this.sportName});
  @override
  State<SportDetails> createState() => _DetailsState();
}

class _DetailsState extends State<SportDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: CustomColors.black,
        child: Column(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 90, 87, 87),
              ),
              child: Row(
                children: [
                  Text(
                    "Coach : ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  // Add more widgets as needed
                ],
              ),
            ),
            //Expanded(
            //       child: ListView.builder(
            //         padding: EdgeInsets.zero,

            //         // events.length,
            //         itemBuilder: (context, index) {
            //           Event event = snapshot.data![index];
            //           // events[index];
            //           return EventWidget(event: event, uparWaaleKaSetState: () {
            //             setState(() {});
            //           });
            //         },
            //       ),
            //     );,
            Text(
              "Coordinator : ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              "Events : ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
