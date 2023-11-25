import 'package:flutter/material.dart';

import '../services/auth.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class WrongEmail extends StatelessWidget {
  const WrongEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FeatherIcons.arrowLeft,
            weight: 700,
            size: 50,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed('/sign_in'); // Example: Navigate back
          },
        ),
        backgroundColor:
            Colors.transparent, // Set the app bar background to transparent
        elevation: 0, // Remove the shadow
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48.0, 32.0, 48.0, 16.0),
        child: Container(
          margin: EdgeInsets.all(20.0), // Add margin on the lower side
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.userX,
                size: 60,
                color: Colors.white,
              ),
              Text(
                'Oops! You logged in with a non IIIT Delhi Google account. This app is only for IIIT Delhi students.',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () async {
                  await signOut();
                  Navigator.of(context).pushReplacementNamed('/sign_in');
                },
                child: Text('Sign out', style: TextStyle(color: Colors.red)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
