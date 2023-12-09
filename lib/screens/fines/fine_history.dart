import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/dateUtil.dart';

import '../../services/db.dart';

class FineHistory extends StatelessWidget {
  final List<dynamic> fineHistory;
  final Function refresh;
  FineHistory(this.fineHistory, this.refresh);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(5, 15, 0, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Fine History",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
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
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return FineHistoryBox(
                    fineHistory[index]['date'].toDate(),
                    fineHistory[index]['equipment'],
                    fineHistory[index]['sport'],
                    fineHistory[index]['amount'].toDouble(),
                    fineHistory[index]['paid']);
              },
              itemCount: fineHistory.length,
              // shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class FineHistoryBox extends StatelessWidget {
  final DateTime date;
  final String equipment;
  final String sport;
  final double amount;
  final bool paid;

  FineHistoryBox(this.date, this.equipment, this.sport, this.amount, this.paid);

  @override
  Widget build(BuildContext context) {
    Color color;

    if (paid) {
      color = Color.fromARGB(255, 100, 233, 100);
    } else {
      color = Color.fromARGB(255, 198, 48, 50);
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
            Text(getTimeAgo(date),
                style: TextStyle(
                  color: const Color.fromARGB(255, 247, 237, 237),
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Equipment: $equipment for sport: $sport',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  '₹ $amount',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 83, 85, 83),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Text(
                    getReadableDate(date) + "  " + getReadableTime(date),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: paid
                      ? null
                      : () async{
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Pay Fine"),
                              content: Text("Are you sure you want to pay this fine?"),
                              actions: [
                                TextButton(onPressed: () async{
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text("Processing"),
                                      content: Text("Please wait while we process your request"),
                                    );
                                  });
                                  await payFine(amount, sport, equipment, date);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }, child: Text("Yes")),
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("No")),
                              ],
                            );
                          });
                        },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Text(
                      paid ? "Paid" : "Unpaid",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
