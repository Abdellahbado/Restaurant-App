import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restau_app/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection =
    _firestore.collection('Food Reservation');

class FirebaseCrud {
  static Future<Response> addUser(
      {required String name,
      required int tableNumber,
      required String foodOrdered,
      required DateTime date}) async {
    Response response = Response();

    // this documentReference is used to reference to a document
    // (which is part of the collection) in firestore
    DocumentReference reference = _collection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      "Name": name,
      "Table Number": tableNumber,
      "Food Ordered": foodOrdered,
      "Date": date
    };
    var result = await reference.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database ";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }

  static Stream<QuerySnapshot> readUser() {
    CollectionReference notesItemCollection = _collection;

    return notesItemCollection.snapshots();
  }
}
