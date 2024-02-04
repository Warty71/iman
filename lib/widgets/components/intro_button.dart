import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroButton extends StatelessWidget {
  final String text;
  const IntroButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => context.go('/auth'),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // * Text - Nastavi
                  Text(
                    text,
                    style: GoogleFonts.roadRage(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),

                  // * SizedBox
                  const SizedBox(
                    width: 5,
                  ),

                  // * Icon - Forward
                  Icon(
                    Icons.forward,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
