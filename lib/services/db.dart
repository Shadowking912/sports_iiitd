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
    student.issuedEquipments = [];
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

Future<List<Event>> getLatestEvents(int numberOfEvents) async {
  try {
    String year = DateFormat('yyyy').format(DateTime.now());
    String month = DateFormat('MMMM').format(DateTime.now());
    var collectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(year)
        .collection(month);
    var snapshot = await collectionRef
        .orderBy('date', descending: true)
        .limit(numberOfEvents)
        .get();
    List<Event> events = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['date'] = (data['date'] as Timestamp).toDate();
      events.add(Event.fromJson(data));
    });
    events.sort((a, b) => b.date.compareTo(a.date));
    if (events.length > numberOfEvents) {
      events = events.sublist(0, numberOfEvents);
    }
    return events;
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

Future<Event> getEventById(String id, String time) async {
  String documentName = time.split('-')[1];
  String collectionName = time.split('-')[0];

  try {
    var collectionRef = FirebaseFirestore.instance
        .collection('events')
        .doc(documentName)
        .collection(collectionName);
    var doc = await collectionRef.where('id', isEqualTo: id).get();
    Map<String, dynamic> data = doc.docs[0].data();
    data['date'] = (data['date'] as Timestamp).toDate();
    return Event.fromJson(data);
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
      'registeredEvents': FieldValue.arrayUnion([
        {
          'eventId': event.id,
          'eventTime': month + '-' + year,
        }
      ])
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
    Student student = await getStudentDocument();
    student.registeredEvents
        .removeWhere((element) => element['eventId'] == event.id);
    await userCollectionRef.doc(userId).update({
      'registeredEvents': student.registeredEvents,
    });
  } catch (e) {
    throw e;
  }
}

Future<Student> getStudentDocument({String userId = ""}) async {
  if (userId == "") {
    userId = FirebaseAuth.instance.currentUser!.uid;
  }
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

Future<void> requestIssueEquipment(String sport, String equipment) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('issueRequests');
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await collectionRef.add({
      'userId': userId,
      'sport': sport,
      'equipment': equipment,
      'date': DateTime.now(),
      'status': 'pending',
    });
  } catch (e) {
    throw e;
  }
}

Future<void> issueEquipment(
    String sport, String equipment, String id, String userId) async {
  // String userId = FirebaseAuth.instance.currentUser!.uid;
  String documentName =
      sport[0].toUpperCase() + sport.substring(1).toLowerCase();
  try {
    var batch = FirebaseFirestore.instance.batch();
    var collectionRef = FirebaseFirestore.instance.collection('users');
    var equipmentRef = FirebaseFirestore.instance.collection('equipments');
    var equipmentDoc = await equipmentRef.doc(documentName).get();
    Map<String, dynamic> data = equipmentDoc.data()!;
    List<dynamic> items = data['Items'];
    items.forEach((element) {
      if (element['Name'] == equipment) {
        element['Quantity'] -= 1;
      }
    });
    batch.update(equipmentDoc.reference, {'Items': items});
    batch.update(collectionRef.doc(userId), {
      'issuedEquipments': FieldValue.arrayUnion([
        {
          'sport': sport,
          'equipment': equipment,
          'date': DateTime.now(),
          'requestId': id,
          'returned': false,
        }
      ])
    });
    await batch.commit();
  } catch (e) {
    throw e;
  }
}

Future<void> returnEquipment(
    String sport, String equipment, String requestId) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String documentName =
      sport[0].toUpperCase() + sport.substring(1).toLowerCase();
  try {
    var batch = FirebaseFirestore.instance.batch();
    var collectionRef = FirebaseFirestore.instance.collection('users');
    var equipmentRef = FirebaseFirestore.instance.collection('equipments');
    var equipmentDoc = await equipmentRef.doc(documentName).get();
    Map<String, dynamic> data = equipmentDoc.data()!;
    List<dynamic> items = data['Items'];
    items.forEach((element) {
      if (element['Name'] == equipment) {
        element['Quantity'] += 1;
      }
    });
    batch.update(equipmentDoc.reference, {'Items': items});
    Student student = await getStudentDocument();
    student.issuedEquipments.forEach((element) {
      if (element['sport'] == sport &&
          element['equipment'] == equipment &&
          element['requestId'] == requestId) {
        element['returned'] = true;
      }
    });
    batch.update(collectionRef.doc(userId), {
      'issuedEquipments': student.issuedEquipments,
    });
    await batch.commit();
  } catch (e) {
    throw e;
  }
}

Future<List> getAllFines() async {
  Student student = await getStudentDocument();
  double totalFine = 0;

  student.fines.forEach((fine) {
    if (!fine['paid']) totalFine += fine['amount'];
  });

  return [totalFine, student.fines];
}

Future<void> payFine(
    double amount, String sport, String equipment, DateTime date) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    Student student = await getStudentDocument();
    student.fines.forEach((fine) {
      if (fine['sport'] == sport &&
          fine['amount'] == amount &&
          !fine['paid'] &&
          fine['equipment'] == equipment &&
          fine['date'].toDate() == date) {
        fine['paid'] = true;
      }
    });
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'fines': student.fines,
    });
  } catch (e) {
    print(e);
    throw e;
  }
}

Future<List> getUserIssueRequests() async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('issueRequests');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var snapshot = await collectionRef.where('userId', isEqualTo: uid).get();
    List requests = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['id'] = doc.id;
      data['date'] = (data['date'] as Timestamp).toDate();
      requests.add(data);
    });
    return requests;
  } catch (e) {
    throw e;
  }
}

Future<List> getUserIssuedEquipments() async {
  try {
    Student student = await getStudentDocument();
    List issuedEquipments = student.issuedEquipments
        .where((element) => !element['returned'])
        .toList();
    return issuedEquipments;
  } catch (e) {
    throw e;
  }
}

Future<void> cancelUserIssueRequest(String id) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('issueRequests');
    await collectionRef.doc(id).delete();
  } catch (e) {
    throw e;
  }
}

Future<List> getUserReturnRequests() async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('returnRequests');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var snapshot = await collectionRef.where('userId', isEqualTo: uid).get();
    List requests = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['id'] = doc.id;
      data['date'] = (data['date'] as Timestamp).toDate();
      requests.add(data);
    });
    return requests;
  } catch (e) {
    throw e;
  }
}

Future<void> requestReturnEquipment(
    String sport, String equipment, String requestId) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('returnRequests');
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await collectionRef.add({
      'userId': userId,
      'sport': sport,
      'equipment': equipment,
      'date': DateTime.now(),
      'status': 'pending',
      'requestId': requestId,
    });
  } catch (e) {
    throw e;
  }
}

Future<List> getAdminIssueRequests() async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('issueRequests');
    var snapshot = await collectionRef.get();
    List requests = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['id'] = doc.id;
      data['date'] = (data['date'] as Timestamp).toDate();
      requests.add(data);
    });
    return requests;
  } catch (e) {
    throw e;
  }
}

Future<void> denyIssueRequest(String id) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('issueRequests');
    await collectionRef.doc(id).update({'status': 'denied'});
  } catch (e) {
    throw e;
  }
}

Future<void> approveIssueRequest(String id, String userId) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('issueRequests');
    var requestDoc = await collectionRef.doc(id).get();
    Map<String, dynamic> data = requestDoc.data()!;
    await issueEquipment(data['sport'], data['equipment'], id, userId);
    await collectionRef.doc(id).update({'status': 'approved'});
  } catch (e) {
    throw e;
  }
}

Future<void> acceptReturnRequest(String id) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('returnRequests');
    var requestDoc = await collectionRef.doc(id).get();
    Map<String, dynamic> data = requestDoc.data()!;
    await returnEquipment(data['sport'], data['equipment'], data['requestId']);
    String sport = data['sport'];
    String documentName =
        sport[0].toUpperCase() + sport.substring(1).toLowerCase();
    var equipmentRef =
        FirebaseFirestore.instance.collection('equipments').doc(documentName);
    var equipmentDoc = await equipmentRef.get();
    Map<String, dynamic> equipmentData = equipmentDoc.data()!;
    List<dynamic> items = equipmentData['Items'];
    items.forEach((element) {
      if (element['Name'] == data['equipment']) {
        element['Quantity'] += 1;
      }
    });
    await equipmentRef.update({'Items': items});
    await collectionRef.doc(id).update({'status': 'approved'});
  } catch (e) {
    throw e;
  }
}

Future<void> denyReturnRequest(String id) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('returnRequests');
    await collectionRef.doc(id).update({'status': 'denied'});
  } catch (e) {
    throw e;
  }
}

Future<List> getAdminReturnRequests() async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('returnRequests');
    var snapshot = await collectionRef.get();
    List requests = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['id'] = doc.id;
      data['date'] = data['date'].toDate();
      requests.add(data);
    });
    requests.sort((a, b) => a['status'] == 'pending' ? -1 : 1);
    return requests;
  } catch (e) {
    throw e;
  }
}

Future<void> fineStudent(
    String equipment, String sport, int amount, String userId) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('users');
    var userDoc = await collectionRef.doc(userId).get();
    Map<String, dynamic> data = userDoc.data()!;
    data['fines'].add({
      'equipment': equipment,
      'sport': sport,
      'amount': amount,
      'date': DateTime.now(),
      'paid': false,
    });
    await collectionRef.doc(userId).update({'fines': data['fines']});
  } catch (e) {
    throw e;
  }
}

Future<List> getUnpaidFines() async {
  try {
    Student student = await getStudentDocument();
    List fines = student.fines;
    fines = fines.where((element) => !element['paid']).toList();
    return fines;
  } catch (e) {
    throw e;
  }
}

Future<String> createSG(SG sg) async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('sgs');
    sg.id = collectionRef.doc().id;
    await collectionRef.doc(sg.id).set(sg.toJson());
    return sg.id;
  } catch (e) {
    throw e;
  }
}

Future<List<SG>> getRunningSGs() async {
  try {
    var collectionRef = FirebaseFirestore.instance.collection('sgs');
    var snapshot = await collectionRef
        .where('deadline', isGreaterThan: DateTime.now())
        .get();
    List<SG> sgs = [];
    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data();
      data['deadline'] = (data['deadline'] as Timestamp).toDate();
      data['participants'] = data['participants'] ?? [];
      data['id'] = doc.id;
      sgs.add(SG.fromJson(data));
    });
    return sgs;
  } catch (e) {
    throw e;
  }
}

Future<void> registerForSG(SG sg) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    var collectionRef = FirebaseFirestore.instance.collection('sgs');
    await collectionRef.doc(sg.id).update({
      'participants': FieldValue.arrayUnion([userId])
    });
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'registeredSGs': FieldValue.arrayUnion([sg.id])
    });
  } catch (e) {
    throw e;
  }
}

Future<void> unregisterForSG(SG sg) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  try {
    var collectionRef = FirebaseFirestore.instance.collection('sgs');
    await collectionRef.doc(sg.id).update({
      'participants': FieldValue.arrayRemove([userId])
    });
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'registeredSGs': FieldValue.arrayRemove([sg.id])
    });
  } catch (e) {
    throw e;
  }
}
