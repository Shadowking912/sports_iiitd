import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_iiitd/services/db.dart';
import '../common/colors.dart';
import '../services/auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: isSignedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return FutureBuilder(
              future: checkIfUserDocExists(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    Future.delayed(Duration.zero, () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);
                    });
                    return Center(
                      child: Text('You are signed in'),
                    );
                  } else {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/create_profile', (Route<dynamic> route) => false);
                    return Center(
                      child: Text('You are signed in'),
                    );
                  }
                } else {
                  return Center(
                    child: Text('You are signed in'),
                  );
                }
              },
            );
          } else {
            return Center(
              child: MaterialButton(
                // style it as a red button
                color: CustomColors.red,

                onPressed: () async {
                  User? user = await signInWithGoogle();
                  if (!user!.email!.contains('iiitd.ac.in')) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/wrong_email', (Route<dynamic> route) => false);
                  } else {
                    bool userDocExists = await checkIfUserDocExists();
                    if (user != null) {
                      if (!userDocExists) {
                        Navigator.of(context)
                            .pushReplacementNamed('/create_profile');
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
                      }
                    }
                  }
                },
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: CustomColors.white,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
