import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkAlertBar extends StatefulWidget {
  const NetworkAlertBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NetworkAlertBarState createState() => _NetworkAlertBarState();
}

class _NetworkAlertBarState extends State<NetworkAlertBar> {
  late ConnectivityResult _connectionStatus;

  @override
  void initState() {
    super.initState();

    // Initialize the connection status
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result;
      });
    });

    // Get the initial connectivity status
    Connectivity().checkConnectivity().then((ConnectivityResult result) {
      setState(() {
        _connectionStatus = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus != ConnectivityResult.none
        ? Container() // No alert if connected
        : Container(
            color: Colors.red, // Customize the color as needed
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'No Internet Connection',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Alert Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Network Alert Bar Example'),
        ),
        body: const Column(
          children: [
            NetworkAlertBar(),
            // Your other widgets go here
          ],
        ),
      ),
    );
  }
}
