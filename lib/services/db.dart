// function to check if document with userid exists in firestore, userid is from firebase auth
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_iiitd/services/models.dart';

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

// function to create student document in firestore
Future<void> createStudentDocument(Student student) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    var collectionRef = FirebaseFirestore.instance.collection('users');
    await collectionRef.doc(userId).set(student.toJson());
  } catch (e) {
    throw e;
  }
}

Future<String> createEvent(Event event) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('events');
    event.id = collectionRef.doc().id;
    await collectionRef.doc(event.id).set(event.toJson());
    return event.id;
  } catch (e) {
    return '';
  }
}

Future<void> editEvent(Event event) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('events');
    await collectionRef.doc(event.id).update(event.toJson());
  } catch (e) {
    throw e;
  }
}

Future<void> deleteEvent(String id) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('events');
    await collectionRef.doc(id).delete();
  } catch (e) {
    throw e;
  }
}

Future<List<Event>> getEvents() async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('events');
    var snapshot = await collectionRef.get();
    List<Event> events = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['date'] = (data['date'] as Timestamp).toDate();
      events.add(Event.fromJson(data));
    });
    return events;
  } catch (e) {
    print(e);
    throw e;
  }
}
