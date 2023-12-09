import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/dateUtil.dart';
import 'package:sports_iiitd/services/db.dart';
import 'package:sports_iiitd/services/models.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar("HISTORY", context, logo: true, goBack: true),
            SearchBar(),
            FutureBuilder(
              future: getStudentDocument(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: SingleChildScrollView(child: EquipmentHistory(student: snapshot.data!)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.38,
                        child: SingleChildScrollView(child: EventHistory(student: snapshot.data!))),
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Text("No History");
                } else
                  return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}

class EquipmentHistory extends StatelessWidget {
  Student student;
  EquipmentHistory({required this.student});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 15, 0, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Equipment History",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Color.fromARGB(255, 198, 48, 50),
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          )),
      Column(children: [
        for (int i = 0; i < student.issuedEquipments.length; i++)
          EquipmentHistoryBox(
            student.issuedEquipments[i]['sport'],
            student.issuedEquipments[i]['returned'],
            student.issuedEquipments[i]['date'].toDate(),
            student.issuedEquipments[i]['equipment'],
          )
      ])
    ]);
  }
}

class EquipmentHistoryBox extends StatelessWidget {
  final String sportName;
  final bool returned;
  final DateTime issueDate;
  final String equipmentName;

  EquipmentHistoryBox(
      this.sportName, this.returned, this.issueDate, this.equipmentName);

  @override
  Widget build(BuildContext context) {
    Color color;
    String status;

    if (returned) {
      color = Color.fromARGB(255, 53, 140, 0);
      status = "Returned";
    } else {
      color = Color.fromARGB(255, 219, 28, 39);
      status = "Pending";
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 43, 43),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(getTimeAgo(issueDate),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 247, 237, 237),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  )),
              Text("Issued $equipmentName for sport: $sportName",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  )),
              Row(
                children: [
                  Expanded(
                      child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 85, 83),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text(getReadableTime(issueDate),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text(status,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          )),
                    )
                  ])),
                  TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ))
                ],
              )
            ]),
      ),
    );
  }
}

class EventHistory extends StatelessWidget {
  final Student student;
  EventHistory({required this.student});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Row(
            children: [
              Expanded(
                  child: Text("Event History",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ))),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: Color.fromARGB(255, 198, 48, 50),
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ))
            ],
          )),
      Column(children: [
        for (int i = 0; i < student.registeredEvents.length; i++)
          EventHistoryBox(student.registeredEvents[i])
      ])
    ]);
  }
}

class EventHistoryBox extends StatelessWidget {
  final Map event;

  EventHistoryBox(this.event);

  @override
  Widget build(BuildContext context) {
    Color color;
    String status;
    color = Color.fromARGB(255, 53, 140, 0);
    status = "Registered";

    return Container(
      width: double.infinity,
      // height: 120,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 43, 43),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
        child: FutureBuilder(
            future: getEventById(event['eventId'], event['eventTime']),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Event event = snapshot.data as Event;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(event.name + " - " + event.sport,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Row(
                        children: [
                          Expanded(
                              child: Row(children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 83, 85, 83),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: Text(
                                  getReadableDate(event.date) +
                                      " " +
                                      getReadableTime(event.date),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: Text(status,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  )),
                            )
                          ])),
                          TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ))
                        ],
                      )
                    ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        // Add padding around the search bar
        padding: EdgeInsets.fromLTRB(4, 5, 4, 0),
        // Use a Material design search bar
        child: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Search...',
            hoverColor: Colors.white,
            // // Add a clear button to the search bar
            // suffixIcon: IconButton(
            //   icon: Icon(Icons.clear),
            //   onPressed: () => _searchController.clear(),
            // ),
            // Add a search icon or button to the search bar
            // prefixIcon: IconButton(
            //   icon: Icon(Icons.search),
            //   onPressed: () {
            //     // Perform the search here
            //   },
            // ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
          ),
        ));
  }
}
