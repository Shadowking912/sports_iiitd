// import 'package:flutter/material.dart';
// import 'package:sports_iiitd/common/colors.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LandingPage extends StatefulWidget {
//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PageView(
//       children: [landingScreen1(), landingScreen2(), landingScreen3()],
//       onPageChanged: (int page) {
//         setState(() {
//           currentPage = page;
//         });
//       },
//     ));
//   }

//   Widget landingScreen1() {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/landing_bg1.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Column(children: [
//         Expanded(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Image.asset("assets/sportscouncil_logo.png"),
//           Text(
//             "  IIITD Sports Council",
//             style: GoogleFonts.plusJakartaSans(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 20,
//                 height: 2),
//           ),
//           Text(
//             "Learn about upcoming events and issue \nsports equipment.",
//             maxLines: 2,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Color.fromARGB(255, 165, 160, 160),
//                 fontWeight: FontWeight.w200,
//                 fontSize: 14,
//                 height: 0),
//           )
//         ])),
//         scrollDotBar(),
//       ]),
//     );
//   }

//   Widget landingScreen2() {
//     return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/landing_bg1.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Container(
//           margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "UNLEASH YOUR ATHLETIC SPIRIT ONLINE!",
//                 style: GoogleFonts.anton(
//                     color: CustomColors.white,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.7,
//                     fontSize: 35,
//                     height: 1.3),
//               ),
//               Text(
//                 "Be a part of IIITD Sports Hub",
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 165, 160, 160),
//                     fontWeight: FontWeight.w300,
//                     fontSize: 16,
//                     letterSpacing: 0,
//                     height: 3),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               scrollDotBar()
//             ],
//           ),
//         ));
//   }

//   Widget landingScreen3() {
//     return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/landing_bg1.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Container(
//           margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "SIGN UP",
//                 style: GoogleFonts.anton(
//                     color: CustomColors.white,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.7,
//                     fontSize: 40,
//                     height: 2),
//               ),
//               Text(
//                 "Login to issue sports equipments and participate \nin events",
//                 style: GoogleFonts.poppins(
//                     color: Color.fromARGB(255, 165, 160, 160),
//                     fontWeight: FontWeight.w300,
//                     fontSize: 13,
//                     letterSpacing: -0.2,
//                     height: 1.2),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(vertical: 35.0),
//                 child: Column(
//                   children: [
//                     ElevatedButton.icon(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Color.fromARGB(255, 126, 20, 26),
//                             fixedSize: Size(320, 30),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5)))),
//                         icon: Icon(
//                           Icons.android,
//                           color: Colors.white,
//                         ),
//                         label: Text(
//                           "Sign in with Google",
//                           style: GoogleFonts.poppins(color: Colors.white),
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               scrollDotBar()
//             ],
//           ),
//         ));
//   }

//   Widget scrollDotBar() {
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           scrollDot(enabled: (currentPage == 0)),
//           scrollDot(enabled: (currentPage == 1)),
//           scrollDot(enabled: (currentPage == 2))
//         ],
//       ),
//     );
//   }

//   Widget scrollDot({enabled = true}) {
//     if (enabled) {
//       return Container(
//           width: 70,
//           height: 5,
//           margin: EdgeInsets.symmetric(horizontal: 1),
//           decoration: BoxDecoration(
//               color: CustomColors.red,
//               borderRadius: BorderRadius.circular(3.0)));
//     } else {
//       return Container(
//           width: 25,
//           height: 5,
//           margin: EdgeInsets.symmetric(horizontal: 1),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(3.0)));
//     }
//   }
// }
