import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';

class Equipment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var SportName;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FeatherIcons.arrowLeft,
            weight: 900,
            size: 50,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed('/sign_in'); // Example: Navigate back
          },
        ),
        backgroundColor:
            Colors.black, // Set the app bar background to transparent
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 2, 20, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar(
              Text(
                "FOOTBALL",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 50,
                ),
              ).data!,
              false,
              context,
              logo: true,
            ),
            // SportWidget(SportName.toUpperCase()),
            FineSummary(),
            MyActions(),
            StockAvailability(),
          ],
        ),
      ),
    );
  }
}

class EquipmentSportWidget {}

class FineSummary extends StatefulWidget {
  @override
  State<FineSummary> createState() => _FineSummaryState();
}

class _FineSummaryState extends State<FineSummary> {
  double fineAmount = 256.22;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
        width: double.infinity,
        height: 125,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 198, 48, 50),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Fines",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 198, 48, 50),
                      elevation: 0,
                      disabledForegroundColor:
                          Colors.white, // Set the text color
                      disabledBackgroundColor:
                          Colors.transparent, // Set the background color
                    ),
                    onPressed: () {
                      // Add code to navigate to the details page
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text("View Details",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Add some space between the button and the fine amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹ $fineAmount",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Latest Fines:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0), // Adjust the padding as needed
                        child: Text(
                          "₹ 12.44",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              // Add some space between the amount and the latest fines
            ],
          ),
        ));
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FineActionBox("Pay Fine", iconMap["plus"] ?? Icons.error,
                "Complete your fine transaction"),
            FineActionBox("Status", iconMap["swap"] ?? Icons.error,
                "Check the status of your fines"),
            FineActionBox("Reports", iconMap["wallet"] ?? Icons.error,
                "Check out your current reports"),
          ],
        ),
      ],
    );
  }
}

class FineActionBox extends StatelessWidget {
  final String boxTitle;
  final IconData iconName;
  final String description;

  FineActionBox(this.boxTitle, this.iconName, this.description);

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

class StockAvailability extends StatelessWidget {
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
        ),
        SizedBox(height: 10), // Adjust the height for the desired spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StockBox("Footballs", 04, "Size 5"),
            StockBox("Cones", 12, "Medium Size"),
            StockBox("Hurdles", 08, "Small Size"),
          ],
        ),
        SizedBox(height: 10), // Adjust the height for the desired spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StockBox("Football Studs", 02, "Size 9"),
          ],
        ),
      ],
    );
  }
}

class StockBox extends StatelessWidget {
  final String boxTitle;
  final int quantity;
  final String description;

  StockBox(this.boxTitle, this.quantity, this.description);

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
