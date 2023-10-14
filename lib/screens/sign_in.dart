import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_iiitd/services/db.dart';
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
                    Navigator.of(context).pushReplacementNamed('/home');
                    return Center(
                      child: Text('You are signed in'),
                    );
                  } else {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.of(context)
                          .pushReplacementNamed('/create_profile');
                    });
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
                color: Colors.red,

                onPressed: () async {
                  User? user = await signInWithGoogle();
                  bool userDocExists = await checkIfUserDocExists();
                  if (user != null) {
                    if (!userDocExists) {
                      Navigator.of(context)
                          .pushReplacementNamed('/create_profile');
                    } else {
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                  }
                },
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Colors.white,
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
