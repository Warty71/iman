import 'package:iman/bloc/user_bloc/user_event.dart';
import 'package:iman/bloc/user_bloc/user_state.dart';
import 'package:iman/widgets/components/login_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/user_bloc/user_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.speed,
                    size: 172,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "Code Master",
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Text(
                      "Subtitle",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.onBackground,
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                          return LoginTile(
                            imagePath: "assets/images/google.png",
                            method: "Google",
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(UserEvent.google);
                            },
                          );
                        }),
                        LoginTile(
                          imagePath: "assets/images/apple_outlined.png",
                          method: "Apple",
                          onPressed: () {
                            BlocProvider.of<UserBloc>(context)
                                .add(UserEvent.apple);
                          },
                        ),
                        LoginTile(
                          imagePath: "assets/images/facebook.png",
                          method: "Facebook",
                          onPressed: () {
                            BlocProvider.of<UserBloc>(context)
                                .add(UserEvent.facebook);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
