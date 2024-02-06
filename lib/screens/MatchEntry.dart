import 'package:flutter/material.dart';


class MatchEntryForm extends StatefulWidget {
  const MatchEntryForm({super.key,required this.title});

  final String title;
  
  @override
  _MatchEntryFormState createState() => _MatchEntryFormState();
}

class _MatchEntryFormState extends State<MatchEntryForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _team1Controller = TextEditingController();
  final TextEditingController _team2Controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Schedule Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _team1Controller,
                decoration: const InputDecoration(labelText: 'Team 1'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Team 1';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _team2Controller,
                decoration: const InputDecoration(labelText: 'Team 2'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Team 2';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, perform match schedule entry logic here
                    // For simplicity, we'll just print the values for now
                    // ignore: avoid_print
                    print('Team 1: ${_team1Controller.text}');
                    // ignore: avoid_print
                    print('Team 2: ${_team2Controller.text}');
                    // ignore: avoid_print
                    print('Date: ${_dateController.text}');
                    // ignore: avoid_print
                    print('Time: ${_timeController.text}');

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
}
