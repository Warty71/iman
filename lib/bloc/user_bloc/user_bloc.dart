import 'package:bloc/bloc.dart';
import 'package:code_master/bloc/user_bloc/user_event.dart';
import 'package:code_master/bloc/user_bloc/user_state.dart';
import 'package:code_master/handlers/firebase_handlers/database_handlers.dart';
import 'package:code_master/managers/snackbar_manager.dart';
import 'package:code_master/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../handlers/firebase_handlers/auth_handlers.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthHandler authHandler = AuthHandler();
  final DatabaseHandler databaseHandler = DatabaseHandler();

  UserBloc() : super(const UserState()) {
    on<UserEvent>((event, emit) async {
      UserCredential? userCredential;
      UserModel? user;

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
