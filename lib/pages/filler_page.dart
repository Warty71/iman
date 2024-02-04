import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FillerPage extends StatelessWidget {
  const FillerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Text(
          "FillerPage",
          style: GoogleFonts.roadRage(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 40),
        ),
      ),
    );
  }
}
