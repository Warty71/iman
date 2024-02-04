import 'package:code_master/bloc/network_bloc/network_bloc.dart';
import 'package:code_master/bloc/network_bloc/network_event.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager {
  // * Listen to Network Changes, and notify the NetworkBloc
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
