import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  // Sign-In (Google)
  Future<UserCredential> signInWithGoogle() async {
    // Begin the auth process.
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtain details from the request (authentication tokens).
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create new credentials for the user.
    final credentials = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Sign the user in.
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
