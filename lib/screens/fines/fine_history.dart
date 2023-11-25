import 'package:flutter/material.dart';

class FineHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(5, 15, 0, 10),
          child: Row(
            children: [
              Expanded(
                  child: Text("Fine History",
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
      FineHistoryBox(
          "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", false),
      FineHistoryBox(
          "Lorem Ipsum do etri grwe superi manaito kei sfiro aanto", true)
    ]);
  }
}

class FineHistoryBox extends StatelessWidget {
  final String description;
  final bool pending;

  FineHistoryBox(this.description, this.pending);

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
      height: 115,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(20, 198, 48, 50),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Color.fromARGB(255, 198, 48, 50))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
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
                    fontSize: 14,
                  )),
              Row(
                children: [
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
                ],
              )
            ]),
      ),
    );
  }
}
