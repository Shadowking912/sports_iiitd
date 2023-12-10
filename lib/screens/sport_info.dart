import 'dart:math';

import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/colors.dart';
import 'package:sports_iiitd/services/models.dart';

class SportInfo extends StatelessWidget {
  final String SportName;
  SportInfo(this.SportName);
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
            // SportDetails(sportName: SportName),
          ],
        ),
      ),
    );
  }
}

// class SportDetails extends StatefulWidget {
//   final String sportName;

//   SportDetails({required this.sportName});
//   @override
//   State<SportDetails> createState() => _DetailsState();
// }

// class _DetailsState extends State<SportDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height,
//       padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
//       color: CustomColors.black,
//       child: Column(
//         children: [
//           Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 53, 51, 51),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "Coach : ",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20,
//                     ),
//                     itemCount: SportDetails.Coach.length,
//                     itemBuilder: (context, index) {
//                       return SportDetails.Coach[index];
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 53, 51, 51),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "Team Members : ",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 53, 51, 51),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "Coordinators : ",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 53, 51, 51),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "Events : ",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
