import 'dart:math';

import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/services/db.dart';

import '../common/dateUtil.dart';
import 'issued_equipments.dart';
import 'request_status.dart';

class SportInfo extends StatelessWidget {
  String SportName;
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
              SportName,
              context,
              logo: true,
              goBack: true,
            ),
            // SportWidget(SportName.toUpperCase()),
            EquipmentFineSummary(sportName: SportName),
            MyActions(),
            StockAvailability(SportName),
          ],
        ),
      ),
    );
  }
}

class EquipmentFineSummary extends StatefulWidget {
  final String sportName;
  EquipmentFineSummary({required this.sportName});
  @override
  State<EquipmentFineSummary> createState() => _EquipmentFineSummaryState();
}

class _EquipmentFineSummaryState extends State<EquipmentFineSummary> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, '/equipment_history');
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
        width: double.infinity,
        height: 125,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 198, 48, 50),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: FutureBuilder(
          future: getFineBySport(widget.sportName.toLowerCase()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),

                    // Add some space between the button and the fine amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${snapshot.data?[0] ?? 0}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Latest Fines:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 15,
                              ),
                            ),
                            for (int i = 0;
                                i < min(2, snapshot.data![1].length);
                                i++)
                              Text(
                                "₹ ${snapshot.data?[1][i]['amount'] ?? 0}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.right,
                              ),
                          ],
                        )
                      ],
                    ),

                    // Add some space between the amount and the latest fines
                  ],
                ),
              );
            } else {
              return Center(child: Text("No data found"));
            }
          },
        ),
      ),
    );
  }
}

class MyActions extends StatelessWidget {
  final Map<String, IconData> iconMap = {
    "plus": IconlyBold.plus,
    "swap": IconlyBold.swap,
    "wallet": IconlyBold.wallet,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Actions",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10), // Adjust the height for the desired spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EquipmentFineActionBox("Pay Fine", iconMap["plus"] ?? Icons.error,
                "Complete your fine transaction", () {}),
            EquipmentFineActionBox("Status", iconMap["swap"] ?? Icons.error,
                "Check the status of your issue/return requests", () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RequestStatusScreen(),
                ),
              );
            }),
            EquipmentFineActionBox(
                "Return Equipment",
                iconMap["wallet"] ?? Icons.error,
                "Return your issued equipments", () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => IssuedEquipmentsScreen(),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}

class EquipmentFineActionBox extends StatelessWidget {
  final String boxTitle;
  final IconData iconName;
  final String description;
  final Function onTap;

  EquipmentFineActionBox(
      this.boxTitle, this.iconName, this.description, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width / 3 - 20,
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
                  Icon(
                    iconName,
                    color: Color.fromARGB(255, 198, 48, 50),
                    size: 20,
                  ),
                  Text(boxTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  Text(description,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 9,
                      ))
                ]),
          ),
        ));
  }
}

class StockAvailability extends StatefulWidget {
  String sportName;
  StockAvailability(this.sportName);

  @override
  State<StockAvailability> createState() => _StockAvailabilityState();
}

class _StockAvailabilityState extends State<StockAvailability> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "Stock Availability",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ), // Adjust the height for the desired spacing
        FutureBuilder(
          future: getEquipmentsBySport(widget.sportName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return StockBox(
                    snapshot.data![index]['Name'],
                    snapshot.data![index]['Quantity'],
                    widget.sportName,
                    setState,
                  );
                  // return Text("Hello");
                },
              );
            }
            return Center(child: Text("No data found"));
          },
        ),
      ],
    );
  }
}

class StockBox extends StatelessWidget {
  final String boxTitle;
  final int quantity;
  final String sportName;
  final Function uparWaaleKaSetState;

  StockBox(
      this.boxTitle, this.quantity, this.sportName, this.uparWaaleKaSetState);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Request Issue of Equipment'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quantity: 1'),
                  SizedBox(height: 10),
                  Text('Date of issue: ${getReadableDate(DateTime.now())}'),
                  SizedBox(height: 10),
                  Text('Time of issue: ${getReadableTime(DateTime.now())}'),
                  SizedBox(height: 10),
                  Text(
                      'You can take the equipment after the request is approved'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            Center(child: CircularProgressIndicator()));
                    // await issueEquipment(sportName, boxTitle);
                    await requestIssueEquipment(sportName, boxTitle);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    uparWaaleKaSetState(() {});
                  },
                  child: Text("Issue"),
                )
              ],
            ),
          );
        },
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width / 3 - 20,
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
                  Text(quantity.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 198, 48, 50),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      )),
                  Text(boxTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                ]),
          ),
        ));
  }
}
