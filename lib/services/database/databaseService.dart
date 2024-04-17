import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  // Future<void> saveOrderToDatabase(String receipt) async {
  //   await orders.add({
  //     'data' : DateTime.now(),
  //     'order': receipt,
  //   });
  // }

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  FirebaseFirestore getDatabase() {
    return _db;
  }

  CollectionReference getDBCollection(String collection) {
    return _db.collection(collection);
  }

  Future<void> dbUserRegister(Map<String, String> userinfo, String collection,
      String currentUserID) async {
    CollectionReference db = _db.collection(collection);
    await db.doc(currentUserID).set({
      "fname": userinfo["fname"],
      "lname": userinfo["lname"],
      "email": userinfo["email"],
      "password": userinfo["password"],
      "time": userinfo["timestamp"],
      "id": userinfo["id"],
    });
  }
}
