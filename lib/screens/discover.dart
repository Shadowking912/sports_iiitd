import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/searchbar.dart';

class Discover extends StatelessWidget {
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
            customAppBar("DISCOVER", context, logo: true, goBack: true),
            CustomSearchBar(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              'assets/' + sportName.toLowerCase().replaceAll(" ", "") + '.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(4),
                child: Icon(
                  IconlyLight.arrow_right_2,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                sportName.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
