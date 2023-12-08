// function to check if document with userid exists in firestore, userid is from firebase auth
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
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
    student.fines = [];
    student.registeredEvents = [];
    await collectionRef.doc(userId).set(student.toJson());
  } catch (e) {
    throw e;
  }
}

Future<String> createEvent(Event event) async {
  try {
    String year = DateFormat('yyyy').format(event.date);
    String month = DateFormat('MMMM').format(event.date);
    var collectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(year)
        .collection(month);
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

Future<List<Event>> getEventsByMonth(String month, String year) async {
  print("getEventsByMonth called");
  try {
    var collectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(year)
        .collection(month);
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

Future<void> registerForEvent(Event event) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String month = DateFormat('MMMM').format(event.date);
  String year = DateFormat('yyyy').format(event.date);
  try {
    var eventCollectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(year)
        .collection(month);
    var userCollectionRef = FirebaseFirestore.instance.collection('users');
    await eventCollectionRef.doc(event.id).update({
      'participants': FieldValue.arrayUnion([userId])
    });
    await userCollectionRef.doc(userId).update({
      'registeredEvents': FieldValue.arrayUnion([event.id])
    });
  } catch (e) {
    throw e;
  }
}

Future<void> unregisterForEvent(Event event) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String month = DateFormat('MMMM').format(event.date);
  String year = DateFormat('yyyy').format(event.date);
  try {
    var eventCollectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(year)
        .collection(month);
    var userCollectionRef = FirebaseFirestore.instance.collection('users');
    await eventCollectionRef.doc(event.id).update({
      'participants': FieldValue.arrayRemove([userId])
    });
    await userCollectionRef.doc(userId).update({
      'registeredEvents': FieldValue.arrayRemove([event.id])
    });
  } catch (e) {
    throw e;
  }
}

Future<Student> getStudentDocument() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    var collectionRef = FirebaseFirestore.instance.collection('users');
    var doc = await collectionRef.doc(userId).get();
    Map<String, dynamic> data = doc.data()!;
    return Student.fromJson(data);
  } catch (e) {
    throw e;
  }
}

Future<List> getEquipmentsBySport(String sport) async {
  String documentName =
      sport[0].toUpperCase() + sport.substring(1).toLowerCase();
  try {
    var collectionRef = FirebaseFirestore.instance.collection('equipments');
    var doc = await collectionRef.doc(documentName).get();
    Map<String, dynamic> data = doc.data()!;
    return data['Items'];
  } catch (e) {
    throw e;
  }
}

Future<List<dynamic>> getFineBySport(String sport) async {
  Student student = await getStudentDocument();
  double totalFine = 0;
  List latestTwoFines = [];
  student.fines.forEach((fine) {
    if (fine['sport'] == sport) {
      totalFine += fine['amount'];
      latestTwoFines.add(fine);
    }
  });
  if (latestTwoFines.length > 2) {
    latestTwoFines = latestTwoFines.sublist(latestTwoFines.length - 2);
  }


  return [totalFine, latestTwoFines];
}
