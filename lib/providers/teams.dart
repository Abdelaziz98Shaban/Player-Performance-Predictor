import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../modals/team.dart';

class Teams with ChangeNotifier {
  List<Team> _teamItems = [];

  List<Team> get teamItems {
    return [..._teamItems];
  }

  Future<void> fetchTeams(int leagueId) async {
    var url =
        'https://api-football-v1.p.rapidapi.com/v2/teams/league/$leagueId';

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'x-rapidapi-host': ' api-football-v1.p.rapidapi.com',
      'x-rapidapi-key': '66d741c7fdmshdf01f12da4de51ap16b6adjsn3c3d982c712d',
    };
    try {
      http.Response response = await http.get(url, headers: requestHeaders);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var teamData = extractedData['api']['teams'] as List;
      if (teamData == null) {
        return;
      }
      final List<Team> loadedTeams = [];
      teamData.forEach((team) {
        loadedTeams.add(
          Team(
              teamId: team['team_id'],
              teamLogo: team['logo'],
              teamName: team['name']),
        );
      });
      _teamItems = loadedTeams;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> teamsBySeason(String leagueName, int selectedItem) {
    var leagueId;
    if (leagueName == 'Premier League') {
      switch (selectedItem) {
        case 2016:
          {
            leagueId = 56;
            fetchTeams(leagueId);
          }
          break;
        case 2017:
          {
            leagueId = 37;
            fetchTeams(leagueId);
          }
          break;
        case 2018:
          {
            leagueId = 2;
            fetchTeams(leagueId);
          }
          break;
        case 2019:
          {
            leagueId = 524;
            fetchTeams(leagueId);
          }
          break;
        case 2020:
          {
            leagueId = 2790;
            fetchTeams(leagueId);
          }
          break;
      }
    } else if (leagueName == 'Laliga') {
      switch (selectedItem) {
        case 2016:
          {
            leagueId = 64;
            fetchTeams(leagueId);
          }
          break;
        case 2017:
          {
            leagueId = 30;
            fetchTeams(leagueId);
          }
          break;
        case 2018:
          {
            leagueId = 87;
            fetchTeams(leagueId);
          }
          break;
        case 2019:
          {
            leagueId = 775;
            fetchTeams(leagueId);
          }
          break;
        case 2020:
          {
            leagueId = 2833;
            fetchTeams(leagueId);
          }
          break;
      }
    } else if (leagueName == 'Bundesliga 1') {
      switch (selectedItem) {
        case 2016:
          {
            leagueId = 54;
            fetchTeams(leagueId);
          }
          break;
        case 2017:
          {
            leagueId = 35;
            fetchTeams(leagueId);
          }
          break;
        case 2018:
          {
            leagueId = 8;
            fetchTeams(leagueId);
          }
          break;
        case 2019:
          {
            leagueId = 754;
            fetchTeams(leagueId);
          }
          break;
        case 2020:
          {
            leagueId = 2755;
            fetchTeams(leagueId);
          }
          break;
      }
    } else if (leagueName == 'Serie A') {
      switch (selectedItem) {
        case 2016:
          {
            leagueId = 66;
            fetchTeams(leagueId);
          }
          break;
        case 2017:
          {
            leagueId = 28;
            fetchTeams(leagueId);
          }
          break;
        case 2018:
          {
            leagueId = 94;
            fetchTeams(leagueId);
          }
          break;
        case 2019:
          {
            leagueId = 891;
            fetchTeams(leagueId);
          }
          break;
        case 2020:
          {
            leagueId = 2857;
            fetchTeams(leagueId);
          }
          break;
      }
    } else if (leagueName == 'Ligue 1') {
      switch (selectedItem) {
        case 2016:
          {
            leagueId = 23;
            fetchTeams(leagueId);
          }
          break;
        case 2017:
          {
            leagueId = 22;
            fetchTeams(leagueId);
          }
          break;
        case 2018:
          {
            leagueId = 4;
            fetchTeams(leagueId);
          }
          break;
        case 2019:
          {
            leagueId = 525;
            fetchTeams(leagueId);
          }
          break;
        case 2020:
          {
            leagueId = 2664;
            fetchTeams(leagueId);
          }
          break;
      }
    } else if (leagueName == 'Egyptian League') {
      switch (selectedItem) {
        case 2016:
          {
            leagueId = 128;
            fetchTeams(leagueId);
          }
          break;
        case 2017:
          {
            leagueId = 127;
            fetchTeams(leagueId);
          }
          break;
        case 2018:
          {
            leagueId = 126;
            fetchTeams(leagueId);
          }
          break;
        case 2019:
          {
            leagueId = 972;
            fetchTeams(leagueId);
          }
          break;
        case 2020:
          {
            leagueId = 972;
            fetchTeams(leagueId);
          }
          break;
      }
    }
  }
}
