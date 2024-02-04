// ignore_for_file: avoid_print

import 'package:iman/bloc/user_bloc/user_state.dart';
import 'package:iman/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc/user_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.user != null) {
          return Scaffold(
            body: Center(
              child: Text("Welcome ${state.user!.username}"),
            ),
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
