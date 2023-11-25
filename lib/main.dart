import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sports_iiitd/screens/Home.dart';
<<<<<<< HEAD
import 'package:sports_iiitd/screens/equipment_history.dart';
import 'package:sports_iiitd/screens/equipments.dart';
import 'package:sports_iiitd/screens/equipment_history.dart';
import 'package:sports_iiitd/screens/profile.dart';
import 'package:sports_iiitd/screens/events.dart';
=======
import 'package:sports_iiitd/screens/fines/fines.dart';
>>>>>>> e788315252ed18da0f1162fc418270f2e556b41f
import 'package:sports_iiitd/screens/view_events.dart';
import 'firebase_options.dart';
import 'screens/create_event.dart';
import 'screens/create_profile.dart';
import 'screens/history.dart';
import 'screens/sign_in.dart';
import 'screens/wrong_email.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
<<<<<<< HEAD
      home: CreateEvent(),
=======
      home: SignInScreen(),
>>>>>>> e788315252ed18da0f1162fc418270f2e556b41f
      // add named routes
      routes: {
        '/home': (context) => HomeScreen(),
        '/view_events': (context) => ViewEvents(),
        '/sign_in': (context) => SignInScreen(),
        '/create_profile': (context) => CreateProfile(),
        '/wrong_email': (context) => const WrongEmail(),
        '/create_event': (context) => CreateEvent(),
        '/history': (context) => History(),
        '/fines': (context) => Fines(),
      },
    );
  }
}
