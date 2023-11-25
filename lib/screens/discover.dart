import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/searchbar.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar("DISCOVER", false, context, logo: true),
            CustomSearchBar(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  SportWidget("FOOTBALL"),
                  SportWidget("BASKETBALL"),
                  SportWidget("TABLE TENNIS"),
                  SportWidget("VOLLEYBALL"),
                  SportWidget("TENNIS"),
                  SportWidget("CRICKET"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SportWidget extends StatelessWidget {
  final String sportName;

  SportWidget(this.sportName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add code to navigate to another page when the widget is clicked.
        // For now, it just prints a message to the console.
        print("Clicked on $sportName");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              'assets/' + sportName.toLowerCase().replaceAll(" ", "") + '.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(4),
                child: Icon(
                  IconlyLight.arrow_right_2,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                sportName.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//class FineHistory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Container(
//           alignment: Alignment.centerLeft,
//           margin: EdgeInsets.fromLTRB(5, 15, 0, 10),
//           child: Row(
//             children: [
//               Expanded(
//                   child: Text("Fine History",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//                       ))),
//               TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "View All",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 198, 48, 50),
//                       fontWeight: FontWeight.w300,
//                       fontSize: 14,
//                     ),
//                   ))
//             ],
//           )),
//       FineHistoryBox(
//           "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", false),
//       FineHistoryBox(
//           "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", true)
//     ]);
//   }
// }

// class FineHistoryBox extends StatelessWidget {
//   final String description;
//   final bool pending;

//   FineHistoryBox(this.description, this.pending);

//   @override
//   Widget build(BuildContext context) {
//     Color color;
//     String status;

//     if (pending) {
//       color = Color.fromARGB(255, 219, 28, 39);
//       status = "Pending";
//     } else {
//       color = Color.fromARGB(255, 53, 140, 0);
//       status = "Paid";
//     }

//     return Container(
//       height: 115,
//       width: double.infinity,
//       margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
//       decoration: BoxDecoration(
//           color: Color.fromARGB(20, 198, 48, 50),
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           border: Border.all(color: Color.fromARGB(255, 198, 48, 50))),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text("12 minutes ago",
//                   style: TextStyle(
//                     color: const Color.fromARGB(255, 247, 237, 237),
//                     fontWeight: FontWeight.w300,
//                     fontSize: 10,
//                   )),
//               Text(description,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   )),
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(5.0),
//                     margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 83, 85, 83),
//                         borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                     child: Text("12:30PM",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10,
//                         )),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(5.0),
//                     margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
//                     decoration: BoxDecoration(
//                         color: color,
//                         borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                     child: Text(status,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10,
//                         )),
//                   )
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
// }

