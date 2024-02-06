import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:cricket_schedule_app/screens/RapidAPI/Sports/Cricbuzz/matchInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Match {
//   final String team1;
//   final String team2;
//   final String date;
//   final String time;
//   final String venue;

//   Match({
//     required this.team1,
//     required this.team2,
//     required this.date,
//     required this.time,
//     required this.venue,

//   });
// }

// class Match {
//   late final int id;
//   // late final json matchInfo;
//   late final String team1;
//   late final String team2;
//   late final String date;
//   late final String time;
//   late final String venue;
// Match({required this.team1, required this.team2});//, required this.date, required this.time});

//   // Factory method to create Match objects from JSON
//   factory Match.fromJson(Map<dynamic, dynamic> json) {
//     return Match(
//       // matchInfo:json[matchInfo]??'',
//       team1: json['team1']["name"] ?? '',
//       team2: json['team2']["name"] ?? '',
//       // date: json['date'] ?? '',
//       // time: json['time'] ?? '',
//     );
//   }
//   // ... other fields and methods

//   // Match.fromJson(Map<dynamic, dynamic> json) {
//   //   id = json['id'];
//   //   team1 = json['team1'];
//   //   team2 = json['team2'];
//   //   date = DateTime.parse(json['date']) as String;
//   //   time = json['time'];
//   //   venue = json['venue'];
//   // }
// }

class MatchSchedulePage extends StatefulWidget {
  const MatchSchedulePage({super.key, required this.title});

  final String title;

  @override
  State<MatchSchedulePage> createState() => _MatchScheduleState();
}

List<Match> matchListFromJson(String str) {
  final jsonData = json.decode(str);
  final matches = <Match>[];
  for (var match in jsonData) {
    matches.add(Match.fromJson(match));
  }
  return matches;
}

Future<List<Match>?> fetchMatches() async {
  List<Match>? matches;
  var headers = {
    'X-RapidAPI-Key': '9de44d2ea7msh358dda242bee5b3p1fe11ejsndfbaa5f95e50',
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
    'content-type': 'application/json', // Assuming JSON response
  };

  var request = http.Request('GET', Uri.parse('https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/41881'));
  request.headers.addAll(headers);

  try {
    http.Response response = await request.send().then((response) {
      // Convert the response to a string
      return http.Response.fromStream(response);
    });

    if (response.statusCode == 200) {
      dynamic responseData = json.decode(response.body);

      if (responseData is List) {
        // Handle list response
        matches = responseData.map((jsonMatch) => Match.fromJson(jsonMatch)).toList();
      } else if (responseData is Map) {
        // Handle map response
        // Adjust the parsing logic based on the actual structure of the map
        // Example: Match.fromJson(responseData['key'])

        Match match = Match.fromJson(responseData);
        // Do something with the single Match object
        
        matches = [match];
      } else {
        throw Exception('Unexpected response type');
      }
    } else {
      // Handle error
      // ignore: avoid_print
      print('Failed to fetch matches. Status code: ${response.statusCode}');
      throw Exception('Failed to fetch matches');
    }
  } catch (error) {
    // Handle other errors
    // ignore: avoid_print
    print('Error: $error');
    throw Exception('Failed to fetch matches');
  }

  return matches;
}


// Future<List<Match>> fetchMatches() async {
//   final response = await http.get(Uri.parse('https://your-api-endpoint'));
//   if (response.statusCode == 200) {
//     // Parse JSON response and create Match objects
//     return matchListFromJson(response.body);
//   } else {
//     throw Exception('Failed to fetch matches');
//   }
// }

  // Dio dio = Dio();

  // try {
  //   final response = await dio.request(
  //     'https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1/41881',
  //     options: Options(
  //       method: 'GET',
  //       headers: {
  //         'X-RapidAPI-Key': '9de44d2ea7msh358dda242bee5b3p1fe11ejsndfbaa5f95e50',
  //         'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com',
  //       },
  //     ),
  //   );

  //   if (response.statusCode == 200) {
  //     // Parse JSON response and create a list of Match objects
  //     List<Match> matches = (response.data as List)
  //         .map((jsonMatch) => Match.fromJson(jsonMatch))
  //         .toList();

  //     return matches;
  //   } else {
  //     throw Exception('Failed to fetch matches');
  //   }
  // } on DioError catch (error) {
  //   // ignore: avoid_print
  //   print('Error: $error');
  //   // ignore: use_rethrow_when_possible
  //   throw error; // Rethrow the error for the calling code to handle
  // }
//}





class _MatchScheduleState extends State<MatchSchedulePage> {
// final List<Match> matches = [
//     Match(team1: 'Team A', team2: 'Team B', date: '2022-01-01', time: '10:00 AM'),
//     Match(team1: 'Team C', team2: 'Team D', date: '2022-01-02', time: '02:30 PM'),
//     // Add more matches as needed
//   ];

  List<Match> matches = [];

  @override
  void initState() {
    super.initState();
    fetchMatches().then((fetchedMatches) {
      setState(() {
        matches = fetchedMatches!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Cricket Match Schedule'),
    ),
    body: ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('${matches[index].matchInfo.team1.name} vs ${matches[index].matchInfo.team2.name}'),
            subtitle: Text('${matches[index].venueInfo.city}, ${matches[index].venueInfo.country} at ${matches[index].venueInfo.timezone}'),
          ),
        );
      },
    ),
  );
}

}
