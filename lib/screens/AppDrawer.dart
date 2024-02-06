import 'package:cricket_schedule_app/screens/GroundEntry.dart';
import 'package:cricket_schedule_app/screens/GroundEntryList.dart';
import 'package:cricket_schedule_app/screens/MatchEntry.dart';
import 'package:cricket_schedule_app/screens/MatchScheduleList.dart';
import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Theme(
        data: Theme.of(context).copyWith(
          // Customize the drawer theme here
          primaryColor: Colors.blue,
            colorScheme: const ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.orange,
          surface: Colors.grey,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,)
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to home page
            },
          ),ListTile(
            leading: const Icon(Icons.new_label_rounded),
              title: const Text('New Ground Entry'),
              onTap: () {
                // Navigate to the match schedule page or perform other actions
                Navigator.pop(context);
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GroundEntryForm( title:'New Ground Entry')),
                      );
              },
            ),
            ListTile(

            leading: const Icon(Icons.list),
              title: const Text('Ground Entry List'),
              onTap: () {
                // Navigate to the match schedule page or perform other actions
                Navigator.pop(context);
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GroundEntryList( title:'Ground Entry List')),
                      );
              },
            ),
            ListTile(

            leading: const Icon(Icons.add),
              title: const Text('New Match Entry'),
              onTap: () {
                // Navigate to the match schedule page or perform other actions
                Navigator.pop(context);
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MatchEntryForm( title:'New Match Entry')),
                      );
              },
            ),
            ListTile(

            leading: const Icon(Icons.schedule),
              title: const Text('Match Schedule'),
              onTap: () {
                // Navigate to the match schedule page or perform other actions
                Navigator.pop(context);
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MatchSchedulePage( title:'Cricket Match Schedule')),
                      );
              },
            ),
            ListTile(

            leading: const Icon(Icons.group),
              title: const Text('Teams'),
              onTap: () {
                // Navigate to the teams page or perform other actions
                Navigator.pop(context);
              },
            ),
            // Add more list items as needed
          
            ListTile(

            leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                // Navigate to the teams page or perform other actions
                Navigator.pop(context);
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
    );
  }
}