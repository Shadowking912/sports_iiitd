import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/colors.dart';
import 'package:sports_iiitd/services/db.dart';

class FineActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      FineActionBox(
          "Pay Fine", "assets/wallet.png", "Complete your fine transaction"),
    ]);
  }
}

class FineActionBox extends StatelessWidget {
  final String boxTitle;
  final String imageSrc;
  final String description;

  FineActionBox(this.boxTitle, this.imageSrc, this.description);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUnpaidFines(),
        builder: (context, snapshot) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Container(
                  height: 200,
                  child: AlertDialog(
                    title: Text("Pay Fine"),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          for (int index = 0;
                              index < snapshot.data!.length;
                              index++)
                            ListTile(
                              splashColor: CustomColors.red.withOpacity(0.1),
                              title: Text(snapshot.data![index]['equipment']),
                              subtitle: Text('Amount: Rs' +snapshot.data![index]['amount']
                                  .toString()),
                              onTap: () async {
                                await payFine(
                                    snapshot.data![index]['amount'].toDouble(),
                                    snapshot.data![index]['sport'],
                                    snapshot.data![index]['equipment'],
                                    snapshot.data![index]['date'].toDate());
                                Navigator.pop(context);
                              },
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Container(
              height: 125,
              width: MediaQuery.of(context).size.width / 3 - 20,
              decoration: BoxDecoration(
                color: CustomColors.red.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: CustomColors.red,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        imageSrc,
                        scale: 1,
                      ),
                      Text(boxTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                      Text(description,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 8,
                          ))
                    ]),
              ),
            ),
          );
        });
  }
}
