// function to check if document with userid exists in firestore, userid is from firebase auth
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> checkIfUserDocExists() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    var collectionRef = FirebaseFirestore.instance.collection('users');
    var doc = await collectionRef.doc(userId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}