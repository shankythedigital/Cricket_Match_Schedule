
class Match {
  final MatchInfo matchInfo;
  final VenueInfo venueInfo;
  final List<BroadcastInfo> broadcastInfo;

  Match({
    required this.matchInfo,
    required this.venueInfo,
    required this.broadcastInfo,
  });

  factory Match.fromJson(Map<dynamic, dynamic> json) {
    return Match(
      matchInfo: MatchInfo.fromJson(json['matchInfo']),
      venueInfo: VenueInfo.fromJson(json['venueInfo']),
      broadcastInfo: (json['broadcastInfo'] as List<dynamic>)
          .map((broadcastInfoJson) => BroadcastInfo.fromJson(broadcastInfoJson))
          .toList(),
    );
  }
}

class MatchInfo {
  final int matchId;
  final String matchDescription;
  final String matchFormat;
  final String matchType;
  final bool complete;
  final bool domestic;
  final int matchStartTimestamp;
  final int matchCompleteTimestamp;
  final bool dayNight;
  final int year;
  final int dayNumber;
  final String state;
  final Team team1;
  final Team team2;
  final Series series;
  final Umpire umpire1;
  final Umpire umpire2;
  final Umpire umpire3;
  final Referee referee;
  final TossResults tossResults;
  final Result result;
  final Venue venue;
  final String status;
  final List<PlayersOfTheMatch> playersOfTheMatch;
  final List<PlayersOfTheSeries> playersOfTheSeries;
  final List<MatchTeamInfo> matchTeamInfo;
  final bool isMatchNotCovered;
  final int hysEnabled;
  final bool livestreamEnabled;
  final bool isFantasyEnabled;
  final List<dynamic> livestreamEnabledGeo;
  final String alertType;
  final String shortStatus;

  MatchInfo({
    required this.matchId,
    required this.matchDescription,
    required this.matchFormat,
    required this.matchType,
    required this.complete,
    required this.domestic,
    required this.matchStartTimestamp,
    required this.matchCompleteTimestamp,
    required this.dayNight,
    required this.year,
    required this.dayNumber,
    required this.state,
    required this.team1,
    required this.team2,
    required this.series,
    required this.umpire1,
    required this.umpire2,
    required this.umpire3,
    required this.referee,
    required this.tossResults,
    required this.result,
    required this.venue,
    required this.status,
    required this.playersOfTheMatch,
    required this.playersOfTheSeries,
    required this.matchTeamInfo,
    required this.isMatchNotCovered,
    required this.hysEnabled,
    required this.livestreamEnabled,
    required this.isFantasyEnabled,
    required this.livestreamEnabledGeo,
    required this.alertType,
    required this.shortStatus,
  });

  factory MatchInfo.fromJson(Map<dynamic, dynamic> json) {
    return MatchInfo(
      matchId: json['matchId']?? '',
      matchDescription: json['matchDescription']?? '',
      matchFormat: json['matchFormat']?? '',
      matchType: json['matchType']?? '',
      complete: json['complete']?? '',
      domestic: json['domestic']?? '',
      matchStartTimestamp: json['matchStartTimestamp']?? '',
      matchCompleteTimestamp: json['matchCompleteTimestamp']?? '',
      dayNight: json['dayNight']?? '',
      year: json['year']?? '',
      dayNumber: json['dayNumber']?? '',
      state: json['state']?? '',
      team1: Team.fromJson(json['team1']),
      team2: Team.fromJson(json['team2']),
      series: Series.fromJson(json['series']),
      umpire1: Umpire.fromJson(json['umpire1']),
      umpire2: Umpire.fromJson(json['umpire2']),
      umpire3: Umpire.fromJson(json['umpire3']),
      referee: Referee.fromJson(json['referee']),
      tossResults: TossResults.fromJson(json['tossResults']),
      result: Result.fromJson(json['result']),
      venue: Venue.fromJson(json['venue']),
      status: json['status']?? '',
      playersOfTheMatch: (json['playersOfTheMatch'] as List<dynamic>)
          .map((playerJson) => PlayersOfTheMatch.fromJson(playerJson))
          .toList(),
      playersOfTheSeries: (json['playersOfTheSeries'] as List<dynamic>)
          .map((playerJson) => PlayersOfTheSeries.fromJson(playerJson))
          .toList(),
      matchTeamInfo: (json['matchTeamInfo'] as List<dynamic>)
          .map((teamInfoJson) => MatchTeamInfo.fromJson(teamInfoJson))
          .toList(),
      isMatchNotCovered: json['isMatchNotCovered']?? '',
      hysEnabled: json['HYSEnabled']?? '',
      livestreamEnabled: json['livestreamEnabled']?? '',
      isFantasyEnabled: json['isFantasyEnabled']?? '',
      livestreamEnabledGeo: json['livestreamEnabledGeo']?? '',
      alertType: json['alertType']?? '',
      shortStatus: json['shortStatus']?? '',
    );
  }
}

class Team {
  final int id;
  final String name;
  final List<PlayerDetails> playerDetails;
  final String shortName;

  Team({
    required this.id,
    required this.name,
    required this.playerDetails,
    required this.shortName,
  });

  factory Team.fromJson(Map<dynamic, dynamic> json) {
    return Team(
      id: json['id']?? '',
      name: json['name']?? '',
      playerDetails: (json['playerDetails'] as List<dynamic>)
          .map((playerDetailsJson) => PlayerDetails.fromJson(playerDetailsJson))
          .toList(),
      shortName: json['shortName']?? '',
    );
  }
}

class PlayerDetails {
  final int id;
  final String name;
  final String fullName;
  final String nickName;
  final bool captain;
  final String role;
  final bool keeper;
  final bool substitute;
  final int teamId;
  final String battingStyle;
  final String bowlingStyle;
  final String teamName;
  final int faceImageId;

  PlayerDetails({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.captain,
    required this.role,
    required this.keeper,
    required this.substitute,
    required this.teamId,
    required this.battingStyle,
    required this.bowlingStyle,
    required this.teamName,
    required this.faceImageId,
  });

  factory PlayerDetails.fromJson(Map<dynamic, dynamic> json) {
    return PlayerDetails(
      id: json['id']?? '',
      name: json['name']?? '',
      fullName: json['fullName']?? '',
      nickName: json['nickName']?? '',
      captain: json['captain']?? '',
      role: json['role']?? '',
      keeper: json['keeper']?? '',
      substitute: json['substitute']?? '',
      teamId: json['teamId']?? '',
      battingStyle: json['battingStyle']?? '',
      bowlingStyle: json['bowlingStyle']?? '',
      teamName: json['teamName']?? '',
      faceImageId: json['faceImageId']?? '',
    );
  }
}

class Series {
  final int id;
  final String name;
  final String seriesType;
  final int startDate;
  final int endDate;
  final String seriesFolder;
  final String odiSeriesResult;
  final String t20SeriesResult;
  final String testSeriesResult;
  final bool tournament;

  Series({
    required this.id,
    required this.name,
    required this.seriesType,
    required this.startDate,
    required this.endDate,
    required this.seriesFolder,
    required this.odiSeriesResult,
    required this.t20SeriesResult,
    required this.testSeriesResult,
    required this.tournament,
  });

  factory Series.fromJson(Map<dynamic, dynamic> json) {
    return Series(
      id: json['id']?? '',
      name: json['name']?? '',
      seriesType: json['seriesType']?? '',
      startDate: json['startDate']?? '',
      endDate: json['endDate']?? '',
      seriesFolder: json['seriesFolder']?? '',
      odiSeriesResult: json['odiSeriesResult']?? '',
      t20SeriesResult: json['t20SeriesResult']?? '',
      testSeriesResult: json['testSeriesResult']?? '',
      tournament: json['tournament']?? '',
    );
  }
}

class Umpire {
  final int id;
  final String name;
  final String country;

  Umpire({
    required this.id,
    required this.name,
    required this.country,
  });

  factory Umpire.fromJson(Map<dynamic, dynamic> json) {
    return Umpire(
      id: json['id']?? '',
      name: json['name']?? '',
      country: json['country']?? '',
    );
  }
}

class Referee {
  final int id;
  final String name;
  final String country;

  Referee({
    required this.id,
    required this.name,
    required this.country,
  });

  factory Referee.fromJson(Map<dynamic, dynamic> json) {
    return Referee(
      id: json['id']?? '',
      name: json['name']?? '',
      country: json['country']?? '',
    );
  }
}

class TossResults {
  // Define properties as needed

  TossResults(); // Add constructor if needed

  factory TossResults.fromJson(Map<dynamic, dynamic> json) {
    // Implement if needed
    return TossResults();
  }
}

class Result {
  final String resultType;
  final String winningTeam;
  final int winningteamId;
  final int winningMargin;
  final bool winByRuns;
  final bool winByInnings;

  Result({
    required this.resultType,
    required this.winningTeam,
    required this.winningteamId,
    required this.winningMargin,
    required this.winByRuns,
    required this.winByInnings,
  });

  factory Result.fromJson(Map<dynamic, dynamic> json) {
    return Result(
      resultType: json['resultType']?? '',
      winningTeam: json['winningTeam']?? '',
      winningteamId: json['winningteamId']?? '',
      winningMargin: json['winningMargin']?? '',
      winByRuns: json['winByRuns']?? '',
      winByInnings: json['winByInnings']?? '',
    );
  }
}

class Venue {
  final int id;
  final String name;
  final String city;
  final String country;
  final String timezone;
  final String latitude;
  final String longitude;

  Venue({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.timezone,
    required this.latitude,
    required this.longitude,
  });

  factory Venue.fromJson(Map<dynamic, dynamic> json) {
    return Venue(
      id: json['id']?? '',
      name: json['name']?? '',
      city: json['city']?? '',
      country: json['country']?? '',
      timezone: json['timezone']?? '',
      latitude: json['latitude']?? '',
      longitude: json['longitude']?? '',
    );
  }
}

class PlayersOfTheMatch {
  final int id;
  final String name;
  final String fullName;
  final String nickName;
  final bool captain;
  final String role;
  final bool keeper;
  final bool substitute;
  final int teamId;
  final String battingStyle;
  final String bowlingStyle;
  final String teamName;
  final int faceImageId;

  PlayersOfTheMatch({
    required this.id,
    required this.name,
    required this.fullName,
    required this.nickName,
    required this.captain,
    required this.role,
    required this.keeper,
    required this.substitute,
    required this.teamId,
    required this.battingStyle,
    required this.bowlingStyle,
    required this.teamName,
    required this.faceImageId,
  });

  factory PlayersOfTheMatch.fromJson(Map<String, dynamic> json) {
    return PlayersOfTheMatch(
      id: json['id']?? '',
      name: json['name']?? '',
      fullName: json['fullName']?? '',
      nickName: json['nickName']?? '',
      captain: json['captain']?? '',
      role: json['role']?? '',
      keeper: json['keeper']?? '',
      substitute: json['substitute']?? '',
      teamId: json['teamId']?? '',
      battingStyle: json['battingStyle']?? '',
      bowlingStyle: json['bowlingStyle']?? '',
      teamName: json['teamName']?? '',
      faceImageId: json['faceImageId']?? '',
    );
  }
}

class PlayersOfTheSeries {
  // Define properties as needed

  PlayersOfTheSeries(); // Add constructor if needed

  factory PlayersOfTheSeries.fromJson(Map<dynamic, dynamic> json) {
    // Implement if needed
    return PlayersOfTheSeries();
  }
}

class RevisedTarget {
  // Define properties as needed

  RevisedTarget(); // Add constructor if needed

  factory RevisedTarget.fromJson(Map<String, dynamic> json) {
    // Implement if needed
    return RevisedTarget();
  }
}

class MatchTeamInfo {
  final int battingTeamId;
  final String battingTeamShortName;
  final int bowlingTeamId;
  final String bowlingTeamShortName;

  MatchTeamInfo({
    required this.battingTeamId,
    required this.battingTeamShortName,
    required this.bowlingTeamId,
    required this.bowlingTeamShortName,
  });

  factory MatchTeamInfo.fromJson(Map<dynamic, dynamic> json) {
    return MatchTeamInfo(
      battingTeamId: json['battingTeamId']?? '',
      battingTeamShortName: json['battingTeamShortName']?? '',
      bowlingTeamId: json['bowlingTeamId']?? '',
      bowlingTeamShortName: json['bowlingTeamShortName']?? '',
    );
  }
}

class BroadcastInfo {
  // Define properties as needed

  BroadcastInfo(); // Add constructor if needed

  factory BroadcastInfo.fromJson(Map<dynamic, dynamic> json) {
    // Implement if needed
    return BroadcastInfo();
  }
}

class VenueInfo {
  final int? established;
  final String? capacity;
  final String? knownAs;
  final String? ends;
  final String? city;
  final String? country;
  final String? timezone;
  final String? homeTeam;
  final bool? floodlights;
  final String? curator;
  final dynamic profile;
  final String? imageUrl;
  final String? ground;
  final double? groundLength;
  final double? groundWidth;
  final dynamic otherSports;

  VenueInfo({
    required this.established,
    required this.capacity,
    required this.knownAs,
    required this.ends,
    required this.city,
    required this.country,
    required this.timezone,
    required this.homeTeam,
    required this.floodlights,
    required this.curator,
    required this.profile,
    required this.imageUrl,
    required this.ground,
    required this.groundLength,
    required this.groundWidth,
    required this.otherSports,
  });

  factory VenueInfo.fromJson(Map<dynamic, dynamic> json) {
    return VenueInfo(
      established: json['established']?? '',
      capacity: json['capacity']?? '',
      knownAs: json['knownAs']?? '',
      ends: json['ends']?? '',
      city: json['city']?? '',
      country: json['country']?? '',
      timezone: json['timezone']?? '',
      homeTeam: json['homeTeam']?? '',
      floodlights: json['floodlights']?? '',
      curator: json['curator']?? '',
      profile: json['profile']?? '',
      imageUrl: json['imageUrl']?? '',
      ground: json['ground']?? '',
      groundLength: json['groundLength']?? '',
      groundWidth: json['groundWidth']?? '',
      otherSports: json['otherSports']?? '',
    );
  }
}
