import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:iman/models/user_model/user.dart';

class DatabaseServices {
  // * Method used to create a new user in the Firestore Database
  Future<void> createUser(auth.UserCredential userCredential) async {
    // Access the user's ID
    final FirebaseFirestore dbRef = FirebaseFirestore.instance;

    final newUser = User(
      uid: userCredential.user!.uid,
      username: userCredential.user!.displayName ?? "",
      email: userCredential.user!.email!,
      lastlogin: DateTime.now().toIso8601String(),
    );

    await dbRef
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(newUser.toJson());
  }

  // * Method used to retrieve the user data from the Firestore Database
  Future<User?> getUser(String uid) async {
    final FirebaseFirestore dbRef = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await dbRef.collection('users').where("uid", isEqualTo: uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot document = querySnapshot.docs.first;
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      User user = User.fromJson(data);
      return user;
    }

    return null;
  }
}
