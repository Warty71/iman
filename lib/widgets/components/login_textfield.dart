import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextfield extends StatefulWidget {
  final TextEditingController textController;
  final String? hintText;
  final bool? obscureText;
  const LoginTextfield({
    super.key,
    required this.textController,
    this.hintText,
    this.obscureText,
  });

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  late bool isFieldVisible;

  @override
  void initState() {
    super.initState();
    isFieldVisible = widget.obscureText!;
  }

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      obscureText: isFieldVisible,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.openSans(
          color: const Color.fromARGB(255, 195, 84, 65),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.obscureText!
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isFieldVisible = !isFieldVisible;
                  });
                },
                child: Icon(
                    color: const Color.fromARGB(255, 65, 44, 118),
                    isFieldVisible ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 65, 44, 118),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 65, 44, 118),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
      ),
      style: GoogleFonts.openSans(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }
}
