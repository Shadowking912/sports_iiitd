import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/dateUtil.dart';
import 'package:sports_iiitd/services/db.dart';
import '../common/CustomAppbar.dart';

class ManageRequests extends StatefulWidget {
  @override
  _ManageRequestsState createState() => _ManageRequestsState();
}

class _ManageRequestsState extends State<ManageRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
          color: Colors.black,
          child: FutureBuilder(
            future: getAdminIssueRequests(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                List pendingRequests = snapshot.data!
                    .where((element) => element['status'] == 'pending')
                    .toList();
                return ListView(
                  padding: EdgeInsets.only(top: 0),
                  children: [
                    customAppBar(
                      'Request Status',
                      context,
                      goBack: true,
                      logo: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Pending Requests:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: pendingRequests.length,
                      itemBuilder: (context, index) {
                        return RequestStatusBox(
                          pendingRequests[index]['sport'],
                          pendingRequests[index]['status'],
                          pendingRequests[index]['date'],
                          pendingRequests[index]['equipment'],
                          pendingRequests[index]['id'],
                          pendingRequests[index]['userId'],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Return Requests:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: getAdminReturnRequests(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.only(top: 0),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return RequestStatusBox(
                                snapshot.data![index]['sport'],
                                snapshot.data![index]['status'],
                                snapshot.data![index]['date'],
                                snapshot.data![index]['equipment'],
                                snapshot.data![index]['id'],
                                snapshot.data![index]['userId'],
                                isReturn: true,
                              );
                            },
                          );
                        }),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class RequestStatusBox extends StatelessWidget {
  final String sportName;
  final String status;
  final DateTime requestDate;
  final String equipmentName;
  final String id;
  final String userId;
  final bool isReturn;

  RequestStatusBox(this.sportName, this.status, this.requestDate,
      this.equipmentName, this.id, this.userId,
      {this.isReturn = false});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (status == 'pending') {
      color = Colors.primaries[3];
    } else if (status == 'approved') {
      color = Color.fromARGB(255, 53, 140, 0);
    } else {
      color = Color.fromARGB(255, 219, 28, 39);
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 43, 43),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
        child: FutureBuilder(
            future: getStudentDocument(userId: userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(getTimeAgo(requestDate),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 247, 237, 237),
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          )),
                      Text("Issued $equipmentName for sport: $sportName",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Text(
                          'Requested by: ${snapshot.data!.name} - ${snapshot.data!.roll}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                      Row(
                        children: [
                          Expanded(
                              child: Row(children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 83, 85, 83),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: Text(getReadableDate(requestDate),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: Text(
                                  status[0].toUpperCase() + status.substring(1),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  )),
                            )
                          ])),
                          if (status == 'pending') TextButton(
                                  onPressed: () async {
                                    // show dialog to approve or reject request
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                Text('Approve/Deny Request?'),
                                            content: Text(isReturn
                                                ? 'Do you want to approve or fine this request?'
                                                : 'Do you want to approve or deny this request?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  !isReturn
                                                      ? await approveIssueRequest(
                                                          id, userId)
                                                      : await acceptReturnRequest(
                                                          id);
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Request approved successfully!'),
                                                    backgroundColor:
                                                        Colors.green,
                                                  ));
                                                  // setState(() {});
                                                },
                                                child: Text('Approve'),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  if (isReturn) {
                                                    // show a dialog asking for a fine amount
                                                    await denyReturnRequest(id);
                                                    // show Dialog asking if the user wants to fine the student
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Fine Student?'),
                                                            content: Text(
                                                                'Do you want to fine the student?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  int fineAmount =
                                                                      0;
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Enter Fine Amount'),
                                                                          content:
                                                                              TextField(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: 'Fine Amount',
                                                                            ),
                                                                            onChanged:
                                                                                (value) {
                                                                              fineAmount = int.parse(value);
                                                                            },
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () async {
                                                                                await fineStudent(equipmentName, sportName, fineAmount);
                                                                                Navigator.pop(context);
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  content: Text('User fined successfully!'),
                                                                                  backgroundColor: Colors.red,
                                                                                ));
                                                                                // setState(() {});
                                                                              },
                                                                              child: Text('Approve'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                                child: Text(
                                                                    'Fine'),
                                                              ),
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  } else {
                                                    await denyIssueRequest(id);

                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Request rejected successfully!'),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ));
                                                  }
                                                  // setState(() {});
                                                },
                                                child: Text(
                                                    isReturn ? 'Fine' : 'Deny'),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Icon(
                                    IconlyLight.edit,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ) else Container(),
                        ],
                      )
                    ]);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
