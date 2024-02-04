import 'package:iman/bloc/user_bloc/user_bloc.dart';
import 'package:iman/constants/light_theme.dart';
import 'package:iman/firebase_options.dart';
import 'package:iman/router/app_router.dart';
import 'package:iman/managers/snackbar_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

final GoRouter _router = AppRouter.router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp.router(
        builder: (context, child) {
          return StreamBuilder<String>(
            stream: SnackbarManager().snackbarStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final message = snapshot.data;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message!),
                      duration: const Duration(seconds: 2),
                      backgroundColor: const Color.fromARGB(255, 99, 73, 191),
                      elevation: 3,
                    ),
                  );
                });
              }
              return child!;
            },
          );
        },
        title: "Iman",
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: lightTheme,
      ),
    );
  }
}
