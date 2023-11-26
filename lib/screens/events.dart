import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/searchbar.dart';
import 'package:intl/intl.dart';

class Event {
  final String name;
  final String month;
  final String day;
  final String date;
  final String description;
  final String img;

  Event({
    this.name = '',
    this.month = '',
    this.day = '',
    this.date = '',
    this.description = '',
    this.img = '',
  });
}

class Events extends StatelessWidget {
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
            customAppBar("EVENTS", context, logo: true, goBack: false),
            CustomSearchBar(),
            MonthlyEvents(),
          ],
        ),
      ),
    );
  }
}

class MonthlyEvents extends StatefulWidget {
  @override
  State<MonthlyEvents> createState() => _MonthlyEventsState();
}

class _MonthlyEventsState extends State<MonthlyEvents> {
  final Map<String, List<Event>> eventsByMonth = {
    "January": [
      Event(name: "Event 1", description: "Description 1"),
      Event(name: "Event 2", description: "Description 2"),
      Event(name: "Event 3", description: "Description 3"),
    ],
    "February": [
      Event(name: "Event 4", description: "Description 4"),
      Event(name: "Event 5", description: "Description 5"),
    ],
    "March": [
      Event(name: "Event 6", description: "Description 6"),
      Event(name: "Event 7", description: "Description 7"),
      Event(name: "Event 8", description: "Description 8"),
      Event(name: "Event 9", description: "Description 9"),
    ],
    "November": [
      Event(
          name: "Football Intra",
          month: "November",
          day: "Friday",
          date: "08",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "event1.jpg"),
      Event(
          name: "Squash Intra",
          month: "November",
          day: "Monday",
          date: "11",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "event2.jpg"),
      Event(
          name: "Badminton Intra",
          month: "November",
          day: "Tuesday",
          date: "12",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "event3.jpg"),
      Event(
          name: "Tennis Intra",
          month: "November",
          day: "Tuesday",
          date: "12",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
          img: "event4.jpg"),
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
    List<Event> events = eventsByMonth[currentMonth] ?? [];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      // Expanded(
      // child: ListView.builder(
      //   itemCount: events.length,
      //   itemBuilder: (context, index) {
      //     Event event = events[index];
      //     return Padding(
      //       padding: EdgeInsets.symmetric(vertical: 8.0),
      //       child: Row(
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(event.name, style: TextStyle(color: Colors.white,
      //           fontSize: 15,)),
      //               Text(event.day+ " "+ event.date , style: TextStyle(color: Colors.white ,
      //           fontSize: 12,)),
      //             ]

      //           ),

      //           Image.network(
      //           event.img, // Replace with the property that holds the image URL
      //           width: 50.0,
      //           height: 50.0,
      //           fit: BoxFit.cover,
      //         ),
      //         ]
      //       ),
      //     );
      //   }
      // )),
    ]);
  }
}
