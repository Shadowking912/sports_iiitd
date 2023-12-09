import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_iiitd/common/colors.dart';

import '../services/auth.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class WrongEmail extends StatelessWidget {
  const WrongEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Set the app bar background to transparent
        elevation: 0, // Remove the shadow
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.all(20.0), // Add margin on the lower side
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.error_outline,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              Text(
                'Oops! You logged in with a Non IIIT Delhi Google account.',
                style: GoogleFonts.poppins(
                  color: CustomColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '\nThis app is only for IIIT Delhi students.',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  autofocus: true,
                  onPressed: () async {
                    await signOut();
                    Navigator.of(context).pushReplacementNamed('/sign_in');
                  },
                  child: Text('Sign out',
                      style: GoogleFonts.poppins(
                          color: CustomColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
