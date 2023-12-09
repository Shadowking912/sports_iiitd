import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/services/db.dart';

import 'fine_summary.dart';
import 'fine_actions.dart';
import 'fine_history.dart';

class Fines extends StatefulWidget {
  @override
  State<Fines> createState() => _FinesState();
}

class _FinesState extends State<Fines> {
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
            customAppBar("FINES", context, logo: true, goBack: true),
            FutureBuilder(
                future: getAllFines(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        FineSummary(snapshot.data![0]),
                        FineActions(),
                        FineHistory(snapshot.data![1], () {
                          setState(() {});
                        }),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
