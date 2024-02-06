import 'package:cricket_schedule_app/screens/ClickableUrlWidget.dart';
import 'package:flutter/material.dart';

class Ground {
  final String name;
  final String address;
  final String googlemapaddress;
  //final String time;

  Ground({
    required this.name,
    required this.address,
    required this.googlemapaddress,
    //required this.time,
  });
}

class GroundEntryList extends StatefulWidget {
  const GroundEntryList({super.key, required this.title});

  final String title;

  @override
  State<GroundEntryList> createState() => _GroundEntryListState();
}

class _GroundEntryListState extends State<GroundEntryList> {
  final List<Ground> grounds = [
    Ground(
        name: 'Ground A',
        address: 'Kharghar',
        googlemapaddress: 'https://maps.google.com/kharghar'),
    Ground(
        name: 'Ground B',
        address: 'Panvel',
        googlemapaddress: 'https://maps.google.com/panvel'),
    // Add more matches as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cricket Match Schedule'),
      ),
      body: ListView.builder(
        itemCount: grounds.length,
        itemBuilder: (context, index) {
          return ClickableUrlWidget(url: grounds[index].googlemapaddress, description: grounds[index].address, title: grounds[index].name,);
          // return Card(
          //   margin: const EdgeInsets.all(8.0),
          //   child: ListTile(
          //     title: Text(
          //         '${index + 1}. Ground name: ${grounds[index].name}, address:  ${grounds[index].address}, Google Maps: ${ grounds[index].googlemapaddress}'),
          //   ),
          // );
        },
      ),
    );
  }
}
