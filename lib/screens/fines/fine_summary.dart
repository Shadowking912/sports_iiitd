import 'package:flutter/material.dart';

class FineSummary extends StatefulWidget {
  final double fineAmount;
  FineSummary(this.fineAmount);
  @override
  State<FineSummary> createState() => _FineSummaryState();
}

class _FineSummaryState extends State<FineSummary> {
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
              "₹ ${widget.fineAmount}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
