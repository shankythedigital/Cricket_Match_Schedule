//import 'package:cricket_schedule_app/screens/login.dart';
import 'package:flutter/material.dart';

import 'screens/AppDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Main Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const MatchDashboard(), //const Login(title: 'Flutter Demo Home Page'),
    );
  }
}

class MatchDashboard extends StatelessWidget {
  const MatchDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cricket Match Dashboard'),
      ),
      drawer: const AppDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnalysisChart(),
            AdsPromotionsSection(),
            UpcomingMatchList(),
          ],
        ),
      ),
    );
  }
}

class AnalysisChart extends StatelessWidget {
  const AnalysisChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for analysis chart
    return Container(
      height: 200.0,
      color: Colors.grey,
      child: const Center(
        child: Text('Analysis Chart Placeholder'),
      ),
    );
  }
}

class AdsPromotionsSection extends StatelessWidget {
  const AdsPromotionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for Ads and Promotions
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ads and Promotions',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          // Add your Ads and Promotions widgets here
          Placeholder(),
          Placeholder(),
        ],
      ),
    );
  }
}

class UpcomingMatchList extends StatelessWidget {
  const UpcomingMatchList({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for Upcoming Match List
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Upcoming Matches',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          // Add your Upcoming Match List widget here
          UpcomingMatchItem(),
          UpcomingMatchItem(),
          UpcomingMatchItem(),
        ],
      ),
    );
  }
}

class UpcomingMatchItem extends StatelessWidget {
  const UpcomingMatchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('Team A vs Team B'),
        subtitle: Text('Date: 2024-01-25, Time: 16:00'),
        // Add more details as needed
      ),
    );
  }
}
