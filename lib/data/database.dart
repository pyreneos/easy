import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});


  updateUserData(String name, String surname) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("easy-b1669-default-rtdb");
    return await ref.set({
      uid:{"name": name,
        "surname": surname,
        "point": 0,}
    }) ;
  }
}
