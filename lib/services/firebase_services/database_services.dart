import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_master/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabaseServices {
  // * Method used to create a new user in the Firestore Database
  Future<void> createUser(UserCredential userCredential) async {
    // Access the user's ID
    final FirebaseFirestore dbRef = FirebaseFirestore.instance;

    final newUser = UserModel(
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
  Future<UserModel?> getUser(String uid) async {
    final FirebaseFirestore dbRef = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await dbRef.collection('users').where("uid", isEqualTo: uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot document = querySnapshot.docs.first;
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      UserModel user = UserModel.fromJson(data);
      return user;
    }

    return null;
  }
}
