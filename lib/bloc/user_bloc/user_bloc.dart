import 'package:bloc/bloc.dart';
import 'package:iman/bloc/user_bloc/user_event.dart';
import 'package:iman/bloc/user_bloc/user_state.dart';
import 'package:iman/handlers/auth_handler.dart';
import 'package:iman/handlers/database_handler.dart';
import 'package:iman/managers/snackbar_manager.dart';
import 'package:iman/models/user_model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthHandler authHandler = AuthHandler();
  final DatabaseHandler databaseHandler = DatabaseHandler();

  UserBloc() : super(const UserState()) {
    on<UserEvent>((event, emit) async {
      auth.UserCredential? userCredential;
      User? user;

      try {
        switch (event) {
          case UserEvent.google:
            emit(state.copyWith(isLoading: true, authMethod: "Google"));

            userCredential = await authHandler.signIn(
              AuthType.google,
            );

            if (userCredential?.user != null) {
              // * If Auth == Success, check if user exists in DB
              user = await databaseHandler.getUser(userCredential!.user!.uid);

              // * If user does not exist, create a new database entry
              if (user == null) {
                // * Create a new user entry in the database
                await databaseHandler.createUser(userCredential);
                user = await databaseHandler.getUser(userCredential.user!.uid);
              }

              SnackbarManager().showSnackbar("Welcome, ${user?.email}!");
            }

            break;

          case UserEvent.signOut:
            await authHandler.signOut();
            user = null;
            break;

          case UserEvent.delete:
            await authHandler.deleteUser();
            user = null;
            break;

          default:
            user = null;
        }
      } catch (e) {
        print(e);
      } finally {
        emit(state.copyWith(
          user: user,
          isLoading: false,
          authMethod: "",
        ));
      }
    });
  }
}
