// ignore_for_file: avoid_print

import 'package:code_master/bloc/user_bloc/user_state.dart';
import 'package:code_master/widgets/cm_snake_bar.dart';
import 'package:code_master/pages/login_page.dart';
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
          return const CmSnakeBar();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
