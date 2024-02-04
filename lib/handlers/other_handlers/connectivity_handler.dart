import 'package:code_master/managers/snackbar_manager.dart';
import 'package:code_master/services/other_services/connectivity_services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHandler {
  final ConnectivityServices _connectivityServices = ConnectivityServices();

  // * Method to get the Current Status of Internet Connection
  Future<ConnectivityResult> checkConnectivity() async {
    try {
      return await _connectivityServices.checkConnectivity();
    } catch (e) {
      SnackbarManager().showSnackbar("e");
      rethrow;
    }
  }
}
