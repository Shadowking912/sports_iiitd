import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class Equipments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EquipmentScreen(),
    );
  }
}

class EquipmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EQUIPMENTS",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: GridView.count(
          crossAxisCount: 2,
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
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/$sportName.png', // Add your image assets
              width: 80,
              height: 80,
            ),
            SizedBox(height: 10),
            Text(
              sportName,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
