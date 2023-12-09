import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import '../services/db.dart';
import '../common/dateUtil.dart';

class IssuedEquipmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getUserIssuedEquipments(),
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
            return Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ListView.builder(
                itemCount: (snapshot.data!
                        .length) +
                    1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: customAppBar(
                        'Issued Equipments',
                        context,
                        goBack: true,
                        logo: true,
                      ),
                    );
                  } else {
                    return ListTile(
                      title: Text('Equipment: ' +
                          snapshot.data![index - 1]
                              ['equipment']),
                      subtitle: Text('Issued on: ' +
                          getReadableDate(snapshot
                              .data![index - 1]['date']
                              .toDate())),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          await requestReturnEquipment(
                            snapshot.data![index - 1]['sport'],
                            snapshot.data![index - 1]
                                ['equipment'],
                            snapshot.data![index - 1]
                                ['requestId'],
                          );
                          Navigator.pop(context);
                        },
                        child: Text('Return'),
                      ),
                    );
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
