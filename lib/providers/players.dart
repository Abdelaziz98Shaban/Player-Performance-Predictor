import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../modals/player.dart';

class Players with ChangeNotifier {
  List<Player> _playerItems = [];

  List<Player> get playerItems {
    return [..._playerItems];
  }

  Future<void> fetchteamsSquad(int teamId) async {
    var url;
    if (1030 <= teamId && teamId <= 1046 || 1572 <= teamId && teamId <= 1577) {
      url =
          'https://api-football-v1.p.rapidapi.com/v3/players?team=$teamId&season=2019';
    } else {
      url =
          'https://api-football-v1.p.rapidapi.com/v3/players?team=$teamId&season=2019';
    }

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'x-rapidapi-host': ' api-football-v1.p.rapidapi.com',
      'x-rapidapi-key': '66d741c7fdmshdf01f12da4de51ap16b6adjsn3c3d982c712d',
    };
    try {
      http.Response response = await http.get(url, headers: requestHeaders);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var responseData = extractedData['response'] as List;
      if (responseData == null) {
        return;
      }

      final List<Player> loadedPlayers = [];
      responseData.forEach((player) {
        var playerStates = player['statistics'] as List;

        loadedPlayers.add(
          Player(
            playerId: player['player']['id'],
            playerImage: player['player']['photo'],
            playerName: player['player']['name'],
            teamLogo: playerStates[0]['team']['logo'],
            nationality: player['player']['nationality'],
            age: player['player']['age'],
            position: playerStates[0]['games']['position'],
            rate: playerStates[0]['games']['rating'],
            gamesAppearences: playerStates[0]['games']['appearences'],
            gamesMinutes: playerStates[0]['games']['minutes'],
            totalShots: playerStates[0]['shots']['total'],
            shotsOnTarget: playerStates[0]['shots']['on'],
            totalGoals: playerStates[0]['goals']['total'],
            goalsAssists: playerStates[0]['goals']['assists'],
            goalsSaves: playerStates[0]['goals']['saves'],
            goalsconceded: playerStates[0]['goals']['conceded'],
            totalPasses: playerStates[0]['passes']['total'],
            keyPasses: playerStates[0]['passes']['key'],
            passesAccuracy: playerStates[0]['passes']['accuracy'],
            totalTackles: playerStates[0]['tackles']['total'],
            blockTackles: playerStates[0]['tackles']['blocks'],
            interceptions: playerStates[0]['tackles']['interceptions'],
            totalDuels: playerStates[0]['duels']['total'],
            duelsWon: playerStates[0]['duels']['won'],
            dribblesAtetempts: playerStates[0]['dribbles']['attempts'],
            dribblesSuccess: playerStates[0]['dribbles']['success'],
            foulsDrawn: playerStates[0]['fouls']['drawn'],
            foulsCommitted: playerStates[0]['fouls']['committed'],
            yellowCards: playerStates[0]['cards']['yellow'],
            redCards: playerStates[0]['cards']['red'],
            penaltyWon: playerStates[0]['penalty']['won'],
            penaltyScored: playerStates[0]['penalty']['scored'],
            penaltyMissed: playerStates[0]['penalty']['missed'],
            substitutionIn: playerStates[0]['substitutes']['in'],
            gamesLineups: playerStates[0]['games']['lineups'],
          ),
        );
      });
      _playerItems = loadedPlayers;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Player findById(int id) {
    return _playerItems.firstWhere((player) => player.playerId == id);
  }

  Future<List> searchforPlayers(String query) async {
    var url = 'https://api-football-v1.p.rapidapi.com/v2/players/search/$query';

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'x-rapidapi-host': ' api-football-v1.p.rapidapi.com',
      'x-rapidapi-key': '66d741c7fdmshdf01f12da4de51ap16b6adjsn3c3d982c712d',
    };
    try {
      http.Response response = await http.get(url, headers: requestHeaders);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var responseData = extractedData['api']['players'] as List;
      if (responseData == null) {
        return [];
      }
      return responseData;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> fetchplayerStatistics(int playerid, int season) async {
    var url =
        'https://api-football-v1.p.rapidapi.com/v3/players?id=$playerid&season=$season';

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'x-rapidapi-host': ' api-football-v1.p.rapidapi.com',
      'x-rapidapi-key': '66d741c7fdmshdf01f12da4de51ap16b6adjsn3c3d982c712d',
    };
    try {
      http.Response response = await http.get(url, headers: requestHeaders);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var responseData = extractedData['response'] as List;
      if (responseData == null) {
        return;
      }

      final List<Player> loadedPlayers = [];
      responseData.forEach((player) {
        var playerStates = player['statistics'] as List;

        loadedPlayers.add(
          Player(
            playerId: player['player']['id'],
            playerImage: player['player']['photo'],
            playerName: player['player']['name'],
            teamLogo: playerStates[0]['team']['logo'],
            nationality: player['player']['nationality'],
            age: player['player']['age'],
            position: playerStates[0]['games']['position'],
            rate: playerStates[0]['games']['rating'],
            gamesAppearences: playerStates[0]['games']['appearences'],
            gamesMinutes: playerStates[0]['games']['minutes'],
            totalShots: playerStates[0]['shots']['total'],
            shotsOnTarget: playerStates[0]['shots']['on'],
            totalGoals: playerStates[0]['goals']['total'],
            goalsAssists: playerStates[0]['goals']['assists'],
            goalsSaves: playerStates[0]['goals']['saves'],
            goalsconceded: playerStates[0]['goals']['conceded'],
            totalPasses: playerStates[0]['passes']['total'],
            keyPasses: playerStates[0]['passes']['key'],
            passesAccuracy: playerStates[0]['passes']['accuracy'],
            totalTackles: playerStates[0]['tackles']['total'],
            blockTackles: playerStates[0]['tackles']['blocks'],
            interceptions: playerStates[0]['tackles']['interceptions'],
            totalDuels: playerStates[0]['duels']['total'],
            duelsWon: playerStates[0]['duels']['won'],
            dribblesSuccess: playerStates[0]['dribbles']['success'],
            dribblesAtetempts: playerStates[0]['dribbles']['attempts'],
            foulsDrawn: playerStates[0]['fouls']['drawn'],
            foulsCommitted: playerStates[0]['fouls']['committed'],
            yellowCards: playerStates[0]['cards']['yellow'],
            redCards: playerStates[0]['cards']['red'],
            penaltyWon: playerStates[0]['penalty']['won'],
            penaltyScored: playerStates[0]['penalty']['scored'],
            penaltyMissed: playerStates[0]['penalty']['missed'],
            substitutionIn: playerStates[0]['substitutes']['in'],
            gamesLineups: playerStates[0]['games']['lineups'],
          ),
        );
      });
      _playerItems = loadedPlayers;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
