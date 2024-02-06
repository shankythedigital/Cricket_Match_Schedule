import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:location/location.dart';


class GroundEntryForm extends StatefulWidget {
  const GroundEntryForm({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  _GroundEntryFormState createState() => _GroundEntryFormState();
}

class _GroundEntryFormState extends State<GroundEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _groundNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  LatLng _selectedLocation = const LatLng(0.0, 0.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ground Entry Form with Address and Google Map'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _groundNameController,
                decoration: const InputDecoration(labelText: 'Ground Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Ground Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Container(
              //   height: 200,
              //   child: GoogleMap(
              //     initialCameraPosition: CameraPosition(
              //       target: _selectedLocation,
              //       zoom: 15,
              //     ),
              //     onTap: (LatLng latLng) {
              //       _selectLocation(latLng);
              //     },
              //   ),
              // ),
              // const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, perform ground entry logic here
                    // For simplicity, we'll just print the values for now
                    // ignore: avoid_print
                    print('Ground Name: ${_groundNameController.text}');
                    // ignore: avoid_print
                    print('Address: ${_addressController.text}');
                    // ignore: avoid_print
                    print('Selected Location: $_selectedLocation');

                    // Additional logic can be added to save the data to a database, etc.
                  }
                },
                child: const Text('Submit'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectLocation(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
        _selectedLocation = latLng;
        _addressController.text =
            '${placemarks.first.name}, ${placemarks.first.locality}';
      });
    }
  }
}
