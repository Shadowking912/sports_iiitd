import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';

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
            customAppBar("HISTORY", true, context, logo: true),
            SearchBar(),
            EquipmentHistory(),
            EventHistory(),
          ],
        ),
      ),
    );
  }
}

class EquipmentHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 15, 0, 10),
          child: Row(
            children: [
              Expanded(
                  child: Text("Equipment History",
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
      EquipmentHistoryBox(
          "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", false),
      EquipmentHistoryBox(
          "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", true)
    ]);
  }
}

class EquipmentHistoryBox extends StatelessWidget {
  final String description;
  final bool pending;

  EquipmentHistoryBox(this.description, this.pending);

  @override
  Widget build(BuildContext context) {
    Color color;
    String status;

    if (pending) {
      color = Color.fromARGB(255, 219, 28, 39);
      status = "Pending";
    } else {
      color = Color.fromARGB(255, 53, 140, 0);
      status = "Paid";
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
              Text("12 minutes ago",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 247, 237, 237),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  )),
              Text(description,
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
                      child: Text("12:30PM",
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
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
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
      EventHistoryBox(
          "Lorem Ipsum do etri grwe superi manto yei fuwro zwer kei sfiro aanto",
          false),
      EventHistoryBox(
          "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", true)
    ]);
  }
}

class EventHistoryBox extends StatelessWidget {
  final String description;
  final bool pending;

  EventHistoryBox(this.description, this.pending);

  @override
  Widget build(BuildContext context) {
    Color color;
    String status;

    if (pending) {
      color = Color.fromARGB(255, 219, 28, 39);
      status = "Pending";
    } else {
      color = Color.fromARGB(255, 53, 140, 0);
      status = "Paid";
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
              Text("12 minutes ago",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 247, 237, 237),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  )),
              Text(description,
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
                      child: Text("12:30PM",
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
