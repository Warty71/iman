import 'package:code_master/bloc/network_bloc/network_bloc.dart';
import 'package:code_master/bloc/network_bloc/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconNetwork extends StatefulWidget {
  const IconNetwork({super.key});

  @override
  State<IconNetwork> createState() => _IconNetworkState();
}

class _IconNetworkState extends State<IconNetwork> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is NetworkInitial) {
          return const Icon(
            Icons.wifi_off,
            color: Colors.grey,
          );
        } else if (state is NetworkSuccess) {
          return const Icon(
            Icons.wifi,
            color: Colors.green,
          );
        } else if (state is NetworkFailure) {
          return const Icon(
            Icons.wifi_off,
            color: Colors.red,
          );
        } else {
          return const Icon(
            Icons.cancel_outlined,
            color: Colors.grey,
          );
        }
      },
    );
  }
}
