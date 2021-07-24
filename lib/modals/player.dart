import 'package:flutter/material.dart';

class Player with ChangeNotifier {
  final int playerId;
  final String playerImage;
  final String teamLogo;
  final String playerName;
  final int age;
  final String nationality;
  final String position;
  final String rate;
  final int gamesAppearences;
  final int gamesMinutes;
  final int totalShots;
  final int shotsOnTarget;
  final int totalGoals;
  final int substitutionIn;
  final int gamesLineups;
  final int goalsAssists;
  final int penaltyWon;
  final int penaltyScored;
  final int penaltyMissed;
  final int totalPasses;
  final int passesAccuracy;
  final int keyPasses;
  final int totalTackles;
  final int blockTackles;
  final int interceptions;
  final int totalDuels;
  final int duelsWon;
  final int dribblesAtetempts;
  final int dribblesSuccess;
  final int foulsDrawn;
  final int foulsCommitted;
  final int goalsconceded;
  final int goalsSaves;
  final int yellowCards;
  final int redCards;

  Player({
    @required this.playerId,
    @required this.playerImage,
    @required this.playerName,
    @required this.teamLogo,
    @required this.age,
    @required this.nationality,
    @required this.position,
    @required this.rate,
    @required this.gamesAppearences,
    @required this.gamesMinutes,
    @required this.totalGoals,
    @required this.goalsAssists,
    @required this.totalPasses,
    @required this.keyPasses,
    @required this.passesAccuracy,
    @required this.shotsOnTarget,
    @required this.totalShots,
    @required this.totalTackles,
    @required this.blockTackles,
    @required this.interceptions,
    @required this.totalDuels,
    @required this.duelsWon,
    @required this.dribblesAtetempts,
    @required this.dribblesSuccess,
    @required this.foulsDrawn,
    @required this.foulsCommitted,
    @required this.goalsconceded,
    @required this.goalsSaves,
    @required this.penaltyWon,
    @required this.penaltyScored,
    @required this.penaltyMissed,
    @required this.substitutionIn,
    @required this.gamesLineups,
    @required this.yellowCards,
    @required this.redCards,
  });
}
