import 'package:code_master/bloc/user_bloc/user_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/user_bloc/user_bloc.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;
  const LoginButton({
    super.key,
    required this.userEmailController,
    required this.userPasswordController,
  });
  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isManualLoginLoading = false;
  late String userEmail;
  late String userPassword;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Ink(
          width: 225,
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 65, 44, 118), width: 2),
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 195, 84, 65),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Center(
              child: isManualLoginLoading
                  ? const SpinKitDualRing(
                      size: 24,
                      color: Colors.white,
                    )
                  : Text(
                      context.tr("loginButton"),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
