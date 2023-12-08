import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/searchbar.dart';
import 'package:intl/intl.dart';
import '../services/models.dart';

class SGs extends StatelessWidget {
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
            customAppBar("SGS", context, logo: true, goBack: false),
            CustomSearchBar(),
            MonthlySGs(),
          ],
        ),
      ),
    );
  }
}

class MonthlySGs extends StatefulWidget {
  @override
  State<MonthlySGs> createState() => _MonthlySGsState();
}

class _MonthlySGsState extends State<MonthlySGs> {
  final Map<String, List<SG>> SGsByMonth = {
    "January": [
      SG(name: "SG 1", description: "Description 1"),
      SG(name: "SG 2", description: "Description 2"),
      SG(name: "SG 3", description: "Description 3"),
    ],
    "February": [
      SG(name: "SG 4", description: "Description 4"),
      SG(name: "SG 5", description: "Description 5"),
    ],
    "March": [
      SG(name: "SG 6", description: "Description 6"),
      SG(name: "SG 7", description: "Description 7"),
      SG(name: "SG 8", description: "Description 8"),
      SG(name: "SG 9", description: "Description 9"),
    ],
    "November": [
      SG(
          name: "Football SG",
          mentor: "Sanyam Goyal",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          startdate: "28/12/2023",
          status: "Open",
          credits: "1",
          img: "SG1.jpg"),
      SG(
          name: "Squash Intra",
          startdate: "8/11/2023",
          status: "Ongoing",
          credits: "1",
          mentor: "Yuvraj Singh",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "SG2.jpg"),
      SG(
          name: "Badminton Intra",
          startdate: "09/10/2023",
          status: "Ongoing",
          credits: "2",
          mentor: "Gurmehak kaur",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "SG3.jpg"),
      SG(
          name: "Tennis Intra",
          startdate: "08/09/2023",
          status: "Completed",
          credits: "1",
          mentor: "Aayush Singh",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "SG4.jpg"),
    ],
  };

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String currentMonth =
        DateFormat('MMMM').format(currentDate); // This will return "November"
    // print(currentMonth);
    String currentYear = DateFormat('yyyy').format(currentDate);
    String displayMonth = currentMonth + ", " + currentYear;
    List<SG> SGs = SGsByMonth[currentMonth] ?? [];

    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding:
              EdgeInsets.fromLTRB(0, 30, 20, 0), // Adjust the padding as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(IconlyLight.arrow_left_2, color: Colors.white),
              Text(
                displayMonth, // Display the month name here
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Icon(IconlyLight.arrow_right_2, color: Colors.white),
              SizedBox(width: 60),
              ElevatedButton(
                onPressed: () {
                  // Add your button onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 95, 22, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the border radius as needed
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                child: Icon(
                  IconlyLight.calendar,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: SGs.length,
                itemBuilder: (context, index) {
                  SG sg = SGs[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 3),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(IconlyBold.more_circle,
                                color: const Color.fromARGB(255, 95, 22, 16)),
                            Container(
                              width: 500,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(sg.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text("Start Date: " + sg.startdate,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 212, 209, 209),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        )),
                                    Text("Mentor: " + sg.mentor,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 212, 209, 209),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        )),
                                    Text("Status: " + sg.status,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 212, 209, 209),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        )),
                                    Text(sg.description,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 212, 209, 209),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                        )),
                                  ]),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              "assets/" + sg.img,
                              width: 40.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                            ),
                          ]),
                    ),
                  );
                })),
      ]),
    );
  }
}
