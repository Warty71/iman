import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:iman/models/user_model/user.dart';
import 'package:iman/services/database_services.dart';
import 'package:iman/managers/snackbar_manager.dart';

class DatabaseHandler {
  final databaseService = DatabaseServices();

  Future<void> createUser(auth.UserCredential userCredential) async {
    try {
      await databaseService.createUser(userCredential);
    } catch (e) {
      SnackbarManager().showSnackbar("Error caught: $e");
    }
  }

  Future<User?> getUser(String uid) async {
    try {
      return await databaseService.getUser(uid);
    } catch (e) {
      SnackbarManager().showSnackbar("Error caught: $e");
      return null;
    }
  }
}
