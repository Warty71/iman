import 'package:code_master/widgets/components/intro_button.dart';
import 'package:easy_localization/easy_localization.dart';
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
                    "CODE MASTER",
                    style: GoogleFonts.roadRage(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 34,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (context.locale == const Locale("en", "EN")) {
                        context.setLocale(
                          const Locale("bs", "BS"),
                        );
                      } else if (context.locale == const Locale("bs", "BS"))
                        // ignore: curly_braces_in_flow_control_structures
                        context.setLocale(
                          const Locale("en", "EN"),
                        );
                    },
                    icon: Icon(
                      Icons.language,
                      color: Theme.of(context).colorScheme.onBackground,
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
                context.tr("introTitle"),
                textAlign: TextAlign.center,
                style: GoogleFonts.roadRage(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 62,
                ),
              ),

              // * Subtitle
              Text(
                context.tr("introSubtitle"),
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
              IntroButton(
                text: context.tr("introButton"),
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
