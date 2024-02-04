import 'package:iman/widgets/components/intro_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // * App Name & Language Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "IMAN",
                    style: GoogleFonts.roadRage(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 34,
                    ),
                  ),
                ],
              ),

              // * SizedBox
              const SizedBox(
                height: 150,
              ),

              // * Title
              Text(
                "Title",
                textAlign: TextAlign.center,
                style: GoogleFonts.roadRage(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 62,
                ),
              ),

              // * Subtitle
              Text(
                "Subtitle",
                textAlign: TextAlign.center,
                style: GoogleFonts.roadRage(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 30,
                ),
              ),

              // * SizedBox
              const SizedBox(
                height: 30,
              ),

              // * Button - Continue
              const IntroButton(
                text: "Continue",
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
