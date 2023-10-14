import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  return null;
}

// function which returns if the user is signed in or not
Future<bool> isSignedIn() async {
  final currentUser = _auth.currentUser;
  return currentUser != null;
}

// function which signs out the user
Future<void> signOut() async {
  await _auth.signOut();
  await googleSignIn.signOut();
}

User? getCurrentUser() {
  return _auth.currentUser;
}

