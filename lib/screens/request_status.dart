import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sports_iiitd/common/dateUtil.dart';
import 'package:sports_iiitd/services/db.dart';
import '../common/CustomAppbar.dart';

class RequestStatusScreen extends StatefulWidget {
  @override
  _RequestStatusScreenState createState() => _RequestStatusScreenState();
}

class _RequestStatusScreenState extends State<RequestStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            color: Colors.black,
            child: FutureBuilder(
              future: getUserIssueRequests(),
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
                  List completedRequests = snapshot.data!
                      .where((element) => element['status'] != 'pending')
                      .toList();
                  return ListView(
                    padding: EdgeInsets.all(0),
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
                        physics: ClampingScrollPhysics(),
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
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Approved/Denied Requests:',
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
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: completedRequests.length,
                        itemBuilder: (context, index) {
                          return RequestStatusBox(
                            completedRequests[index]['sport'],
                            completedRequests[index]['status'],
                            completedRequests[index]['date'],
                            completedRequests[index]['equipment'],
                            completedRequests[index]['id'],
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
                        future: getUserReturnRequests(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            padding: EdgeInsets.only(top: 0),
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return RequestStatusBox(
                                snapshot.data![index]['sport'],
                                snapshot.data![index]['status'],
                                snapshot.data![index]['date'],
                                snapshot.data![index]['equipment'],
                                snapshot.data![index]['id'],
                              );
                            },
                          );
                        }
                      ),
                    ],
                  );
                }
              },
            ),
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

  RequestStatusBox(this.sportName, this.status, this.requestDate,
      this.equipmentName, this.id);

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
        child: Column(
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
              Row(
                children: [
                  Expanded(
                      child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 85, 83),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
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
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text(status[0].toUpperCase() + status.substring(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          )),
                    )
                  ])),
                  status == 'pending'
                      ? TextButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Cancelling Request'),
                                    content: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                });
                            await cancelUserIssueRequest(id);
                            Navigator.pop(context);
                          },
                          child: Icon(
                            IconlyLight.delete,
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      : Container(),
                ],
              )
            ]),
      ),
    );
  }
}
