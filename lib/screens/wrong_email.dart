import 'package:flutter/material.dart';

import '../services/auth.dart';

class WrongEmail extends StatelessWidget {
  const WrongEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48.0, 32.0, 48.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Oops! You logged in with a non IIIT Delhi Google account. This app is only for IIIT Delhi students.',
                style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: () async {
                await signOut();
                Navigator.of(context).pushReplacementNamed('/sign_in');
              },
              child: Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
