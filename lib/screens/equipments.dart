import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/common/searchbar.dart';
import 'package:sports_iiitd/screens/equipment_history.dart';

import '../common/colors.dart';

class EquipmentScreen extends StatefulWidget {
  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  final List<String> sports = [
    "FOOTBALL",
    "BASKETBALL",
    "TABLE TENNIS",
    "VOLLEYBALL",
    "TENNIS",
    "CRICKET"
  ];

  List<String> filteredSports = [];
  @override
  void initState() {
    filteredSports = sports;
    super.initState();
  }

  void search(String query) {
    filteredSports = sports
        .where(
            (sport) => sport.toLowerCase().contains(query.toLowerCase().trim()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: CustomColors.black,
        child: Column(
          children: [
            customAppBar(
              "EQUIPMENTS",
              context,
              logo: true,
            ),
            SizedBox(height: 20),
            CustomSearchBar(
              onChanged: search,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: filteredSports.length,
                itemBuilder: (context, index) {
                  return SportWidget(filteredSports[index]);
                },
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
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Equipment();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.white,
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
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(4),
                child: Icon(
                  IconlyLight.arrow_right_2,
                  color: CustomColors.red,
                  size: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: CustomColors.red.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                sportName.toUpperCase(),
                style: TextStyle(
                  color: CustomColors.white,
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
