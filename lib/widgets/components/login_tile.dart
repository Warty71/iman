import 'package:iman/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../bloc/user_bloc/user_bloc.dart';

class LoginTile extends StatelessWidget {
  final String imagePath;
  final String method;
  final VoidCallback onPressed;

  const LoginTile({
    super.key,
    required this.imagePath,
    required this.method,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                onPressed();
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: (state.isLoading == true && state.authMethod == method)
                    ? const SpinKitDualRing(
                        size: 40,
                        color: Colors.black,
                      )
                    : Image.asset(
                        imagePath,
                        height: 40,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
