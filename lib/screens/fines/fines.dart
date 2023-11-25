import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';

import 'fine_summary.dart';
import 'fine_actions.dart';
import 'fine_history.dart';

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
            customAppBar("FINES", context, logo: true, goBack: true),
            FineSummary(),
            FineActions(),
            FineHistory(),
          ],
        ),
      ),
    );
  }
}
