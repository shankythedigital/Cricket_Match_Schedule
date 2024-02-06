
import 'package:flutter/material.dart';
//import 'package:network_handler/connectivity_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'NetworkAlertBar.dart';


class ConnectionAlert extends StatefulWidget {
  const ConnectionAlert({super.key});
  @override
  State<ConnectionAlert> createState() => _ConnectionAlertState();
}
class _ConnectionAlertState extends State<ConnectionAlert> {
  ConnectivityController connectivityController = ConnectivityController();
  @override
  void initState() {
    connectivityController.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: connectivityController.isConnected,
        builder: (context, value, child) {
          if (value) {
            return const SizedBox();
          } else {
            return const NetworkAlertBar();
          }
        });
  }
}


class ConnectivityController {
  ValueNotifier<bool> isConnected = ValueNotifier(false);
  Future<void> init() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isInternetConnected(result);
    });
  }
  bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}