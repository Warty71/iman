import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityServices {
  // * Method to get the Current Status of Internet Connection
  Future<ConnectivityResult> checkConnectivity() async {
    return await Connectivity().checkConnectivity();
  }
}
