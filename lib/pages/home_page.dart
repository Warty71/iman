import 'package:code_master/widgets/cm_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CmAppBar(),
        body: SafeArea(
            child: Center(
          child: Text(
            "HomePage",
            style: GoogleFonts.roadRage(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 40,
            ),
          ),
        )),
      ),
    );
  }
}
