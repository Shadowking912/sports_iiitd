import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';

class Fines extends StatelessWidget {
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
            customAppBar("FINES", true, context, logo: true),
            FineSummary(),
            FineActions(),
            FineHistory(),
          ],
        ),
      ),
    );
  }
}

class FineSummary extends StatefulWidget {
  @override
  State<FineSummary> createState() => _FineSummaryState();
}

class _FineSummaryState extends State<FineSummary> {
  double fineAmount = 354.56;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 198, 48, 50),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
            padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Fines",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "₹ $fineAmount",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                )
              ],
            )));
  }
}

class FineActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      FineActionBox(
          "Pay Fine", "assets/wallet.png", "Complete your fine transaction"),
      FineActionBox("Status", "assets/document_red.png",
          "Check the status of your fines"),
      FineActionBox(
          "Reports", "assets/danger.png", "Check out your current reports")
    ]);
  }
}

class FineActionBox extends StatelessWidget {
  final String boxTitle;
  final String imageSrc;
  final String description;

  FineActionBox(this.boxTitle, this.imageSrc, this.description);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          height: 125,
          width: 95,
          decoration: BoxDecoration(
              color: Color.fromARGB(25, 198, 48, 50),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color.fromARGB(255, 198, 48, 50))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    imageSrc,
                    scale: 1,
                  ),
                  Text(boxTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )),
                  Text(description,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 8,
                      ))
                ]),
          ),
        ));
  }
}

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
