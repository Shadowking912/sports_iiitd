import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/colors.dart';
import 'package:sports_iiitd/common/dateUtil.dart';
import 'package:sports_iiitd/common/searchbar.dart';
import 'package:intl/intl.dart';
import 'package:sports_iiitd/services/db.dart';
import '../services/models.dart';

// class Event {
//   final String name;
//   final String month;
//   final String day;
//   final String date;
//   final String description;
//   final String img;

//   Event({
//     this.name = '',
//     this.month = '',
//     this.day = '',
//     this.date = '',
//     this.description = '',
//     this.img = '',
//   });
// }

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStudentDocument(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return Center(
              child: Text("No events", style: TextStyle(color: Colors.white)),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(12, 60, 12, 0),
                color: Colors.black,
                child: Column(
                  children: [
                    customAppBar("EVENTS", context, logo: true, goBack: false),
                    SizedBox(height: 10),
                    CustomSearchBar(),
                    MonthlyEvents(),
                  ],
                ),
              ),
              floatingActionButton: snapshot.data!.isSuperAdmin
                  ? FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create_event');
                      },
                      tooltip: 'Create Event',
                      child: const Icon(Icons.add),
                    )
                  : null,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class MonthlyEvents extends StatefulWidget {
  @override
  State<MonthlyEvents> createState() => _MonthlyEventsState();
}

class _MonthlyEventsState extends State<MonthlyEvents> {
  // final Map<String, List<Event>> eventsByMonth = {
  //   "December": [
  //     Event(name: "Event 1", description: "Description 1"),
  //     Event(name: "Event 2", description: "Description 2"),
  //     Event(name: "Event 3", description: "Description 3"),
  //   ],
  //   "September": [
  //     Event(name: "Event 4", description: "Description 4"),
  //     Event(name: "Event 5", description: "Description 5"),
  //   ],
  //   "October": [
  //     Event(name: "Event 6", description: "Description 6"),
  //     Event(name: "Event 7", description: "Description 7"),
  //     Event(name: "Event 8", description: "Description 8"),
  //     Event(name: "Event 9", description: "Description 9"),
  //   ],
  //   "November": [
  //     Event(
  //         name: "Football Intra",
  //         month: "November",
  //         day: "Friday",
  //         date: "08",
  //         description:
  //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
  //         img: "event1.jpg"),
  //     Event(
  //         name: "Squash Intra",
  //         month: "November",
  //         day: "Monday",
  //         date: "11",
  //         description:
  //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
  //         img: "event2.jpg"),
  //     Event(
  //         name: "Badminton Intra",
  //         month: "November",
  //         day: "Tuesday",
  //         date: "12",
  //         description:
  //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
  //         img: "event3.jpg"),
  //     Event(
  //         name: "Tennis Intra",
  //         month: "November",
  //         day: "Tuesday",
  //         date: "12",
  //         description:
  //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod.",
  //         img: "event4.jpg"),
  //   ],
  // };

  DateTime currentDate = DateTime.now();
  String currentMonth = ""; // This will return "November"
  // print(currentMonth);
  String currentYear = "";
  String displayMonth = "";
  List<Event> events = [];
  Map<String, List<Event>> eventsByMonth = {};

  @override
  void initState() {
    currentMonth = DateFormat('MMMM').format(currentDate);
    currentYear = DateFormat('yyyy').format(currentDate);
    displayMonth = currentMonth + ", " + currentYear;
    events = eventsByMonth[currentMonth] ?? [];
    super.initState();
  }

  bool showRegistered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding:
              EdgeInsets.fromLTRB(0, 15, 16, 0), // Adjust the padding as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(IconlyLight.arrow_left_2, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        currentDate = currentDate.subtract(Duration(days: 30));
                        currentMonth = DateFormat('MMMM').format(currentDate);
                        currentYear = DateFormat('yyyy').format(currentDate);
                        displayMonth = currentMonth + ", " + currentYear;
                        events =
                            eventsByMonth[currentMonth + currentYear] ?? [];
                      });
                    },
                  ),
                  Text(
                    displayMonth, // Display the month name here
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    constraints: BoxConstraints(
                      maxWidth: 40,
                      maxHeight: 40,
                    ),
                    icon: Icon(IconlyLight.arrow_right_2, color: Colors.white),
                    onPressed: () {
                      // print(eventsByMonth);
                      setState(() {
                        currentDate = currentDate.add(Duration(days: 30));
                        currentMonth = DateFormat('MMMM').format(currentDate);
                        currentYear = DateFormat('yyyy').format(currentDate);
                        displayMonth = currentMonth + ", " + currentYear;
                        events =
                            eventsByMonth[currentMonth + currentYear] ?? [];
                      });
                      // print(events[0]);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2025));
                  // Add your button onPressed logic here
                  // FormBuilderDateTimePicker(
                  //     name: "Event Date", inputType: InputType.date);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 95, 22, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the border radius as needed
                  ),
                  padding: EdgeInsets.all(0),
                  minimumSize: Size(40, 32),
                ),
                child: Icon(
                  IconlyLight.calendar,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
          alignment: Alignment.center,
          child: Text(
            "|| Swipe events to register/unregister ||",
            style: GoogleFonts.poppins(
              color: Color.fromARGB(179, 247, 243, 243),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        Row(
          children: [
            // todo: Create the logic for the choice chips
            // ChoiceChip(
            //   label: Text("Registered"),
            //   selected: showRegistered,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15)),
            //   onSelected: (bool selected) {
            //     setState(() {
            //       showRegistered = selected; // Add your onPressed logic here
            //     });
            //   },
            //   selectedColor: Color.fromARGB(255, 95, 22, 16),
            //   disabledColor: CustomColors.black,
            // ),
          ],
        ),
        FutureBuilder(
            future: getEventsByMonth(currentMonth, currentYear),
            builder: (context, snapshot) {
              print(eventsByMonth);
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    // events.length,
                    itemBuilder: (context, index) {
                      Event event = snapshot.data![index];
                      // events[index];
                      return EventWidget(
                          event: event,
                          uparWaaleKaSetState: () {
                            setState(() {});
                          });
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasData) {
                return Center(
                  child:
                      Text("No events", style: TextStyle(color: Colors.white)),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ]),
    );
  }
}

class EventWidget extends StatefulWidget {
  EventWidget({
    super.key,
    required this.event,
    required this.uparWaaleKaSetState,
  });

  final Event event;
  final Function uparWaaleKaSetState;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.event.id),
      direction: widget.event.participants.contains(user!.uid)
          ? DismissDirection.endToStart
          : DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        print("object");
        if (direction == DismissDirection.endToStart) {
          print("swiped right");
          await unregisterForEvent(widget.event);
          widget.event.participants.remove(user!.uid);
          widget.uparWaaleKaSetState();
        } else {
          print("swiped left");
          await registerForEvent(widget.event);
          widget.event.participants.add(user!.uid);
          widget.uparWaaleKaSetState();
        }
        return false;
      },
      background: Container(
        color: widget.event.participants.contains(user!.uid)
            ? Colors.red
            : Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: widget.event.participants.contains(user!.uid)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Icon(
                widget.event.participants.contains(user!.uid)
                    ? Icons.delete
                    : Icons.add,
                color: Colors.white,
              ),
              Text(
                widget.event.participants.contains(user!.uid)
                    ? "Unregister"
                    : "Register",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      onDismissed: (DismissDirection direction) async {},
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(IconlyBold.more_circle,
                //     color: const Color.fromARGB(255, 95, 22, 16)),
                Container(
                  width: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.name + " - " + widget.event.sport,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        getReadableDate(widget.event.date) +
                            " - " +
                            widget.event.location,
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 212, 209, 209),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 20),
                      ExpandableText(
                        widget.event.description,
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 212, 209, 209),
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                        expandText: "Read more",
                        collapseText: "Read Less",
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/" + sportsImages[widget.event.sport]!,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        "assets/sportscouncil_logo.png",
                        width: MediaQuery.of(context).size.width * 0.2,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            widget.event.participants.contains(user!.uid)
                ? Container(
                    height: 10,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green.shade800, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        // stops: [0.3, 0.8],
                      ),
                    ),
                  )
                : Divider(),
          ],
        ),
      ),
    );
  }
}
