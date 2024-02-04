// ignore_for_file: avoid_print
import 'package:iman/services/auth_services.dart';
import 'package:iman/managers/snackbar_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthType { google, apple, linkedin, signOut }

class AuthHandler {
  final authService = FirebaseAuthServices();

  Future<UserCredential?> signIn(AuthType type,
      {String? userEmail, String? userPassword}) async {
    try {
      switch (type) {
        case AuthType.google:
          return authService.signInWithGoogle();
        default:
          return authService.signInWithGoogle();
      }
    } on Exception catch (e) {
      print("Error Caught: $e");
      SnackbarManager().showSnackbar(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await authService.signOut();
    } catch (e) {
      SnackbarManager().showSnackbar(e.toString());
    }
  }

  Future<void> deleteUser() async {
    try {
      await authService.deleteUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } on Exception catch (e) {
      SnackbarManager().showSnackbar(e.toString());
    }
  }
}
