import 'package:iman/bloc/user_bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../widgets/components/user_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Title
                Text(
                  "My Profile",
                  style: GoogleFonts.roadRage(
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // * Main Info
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          // * Avatar
                          CircleAvatar(
                            minRadius: 70,
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text(
                              "Image",
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),

                          // * Name and Surname
                          Text(
                            "Meris Lihić",
                            style: GoogleFonts.roadRage(
                              fontSize: 34,
                              letterSpacing: 0.45,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),

                          // * Title
                          Text(
                            "Flutter Engineer",
                            style: GoogleFonts.roadRage(
                              fontSize: 28,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // * More Info
                Text(
                  "Account & Settings",
                  style: GoogleFonts.roadRage(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),

                // * Additional Settings
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

                // * ListView
                UserTile(
                  title: "User Details",
                  icon: Icon(
                    Icons.person,
                    size: 28,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onTap: () {
                    context.push("/cv");
                  },
                ),
                UserTile(
                  title: "Sign Out",
                  icon: Icon(
                    Icons.logout,
                    size: 28,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onTap: () {
                    BlocProvider.of<UserBloc>(context).add(UserEvent.signOut);
                  },
                ),
                UserTile(
                  title: "Delete Account",
                  icon: Icon(
                    Icons.delete,
                    size: 28,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onTap: () {
                    BlocProvider.of<UserBloc>(context).add(UserEvent.delete);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
