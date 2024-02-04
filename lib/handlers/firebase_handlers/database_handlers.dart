import 'package:code_master/models/user_model/user_model.dart';
import 'package:code_master/services/firebase_services/database_services.dart';
import 'package:code_master/managers/snackbar_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseHandler {
  final databaseService = FirebaseDatabaseServices();

  Future<void> createUser(UserCredential userCredential) async {
    try {
      await databaseService.createUser(userCredential);
    } catch (e) {
      SnackbarManager().showSnackbar("Error caught: $e");
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      return await databaseService.getUser(uid);
    } catch (e) {
      SnackbarManager().showSnackbar("Error caught: $e");
      return null;
    }
  }
}
