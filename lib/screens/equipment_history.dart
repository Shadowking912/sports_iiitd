import 'package:flutter/material.dart';

import '../common/colors.dart';

class EquipmentHistory extends StatefulWidget {
  EquipmentHistory({Key? key}) : super(key: key);

  @override
  State<EquipmentHistory> createState() => _EquipmentHistoryState();
}

class _EquipmentHistoryState extends State<EquipmentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.red,
                    ),
                    Text(
                      "GO BACK",
                      style: TextStyle(
                        color: CustomColors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "HISTORY",
                  style: TextStyle(
                    color: CustomColors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 46,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
