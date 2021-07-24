import 'package:flutter/material.dart';
import 'package:player_performance_predictor/screens/prediction_screen.dart';
import 'package:player_performance_predictor/widgets/stats_tile.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PlayerStatsItem extends StatefulWidget {
  final String playerImage;
  final String teamLogo;
  final String playerName;

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

  PlayerStatsItem({
    @required this.playerImage,
    @required this.playerName,
    @required this.teamLogo,
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

  @override
  _PlayerStatsItemState createState() => _PlayerStatsItemState();
}

class _PlayerStatsItemState extends State<PlayerStatsItem> {
  var predictionResult;

  Future<void> predictPerformance() async {
    try {
      final interpreter = await Interpreter.fromAsset('predicton.tflite');
      List<dynamic> inputData = [
        [
          widget.totalShots != null ? widget.totalShots.toDouble() : 0.0,
          widget.shotsOnTarget != null ? widget.shotsOnTarget.toDouble() : 0.0,
          widget.totalGoals != null ? widget.totalGoals.toDouble() : 0.0,
          widget.goalsAssists != null ? widget.goalsAssists.toDouble() : 0.0,
          widget.totalPasses != null ? widget.totalPasses.toDouble() : 0.0,
          widget.keyPasses != null ? widget.keyPasses.toDouble() : 0.0,
          widget.passesAccuracy != null
              ? widget.passesAccuracy.toDouble()
              : 0.0,
          widget.totalTackles != null ? widget.totalTackles.toDouble() : 0.0,
          widget.blockTackles != null ? widget.blockTackles.toDouble() : 0.0,
          widget.interceptions != null ? widget.interceptions.toDouble() : 0.0,
          widget.totalDuels != null ? widget.totalDuels.toDouble() : 0.0,
          widget.duelsWon != null ? widget.duelsWon.toDouble() : 0.0,
          widget.dribblesAtetempts != null
              ? widget.dribblesAtetempts.toDouble()
              : 0.0,
          widget.dribblesSuccess != null
              ? widget.dribblesSuccess.toDouble()
              : 0.0,
          widget.foulsDrawn != null ? widget.foulsDrawn.toDouble() : 0.0,
          widget.foulsCommitted != null
              ? widget.foulsCommitted.toDouble()
              : 0.0,
          widget.yellowCards != null ? widget.yellowCards.toDouble() : 0.0,
          widget.redCards != null ? widget.redCards.toDouble() : 0.0,
          widget.penaltyWon != null ? widget.penaltyWon.toDouble() : 0.0,
          widget.penaltyScored != null ? widget.penaltyScored.toDouble() : 0.0,
          widget.penaltyMissed != null ? widget.penaltyMissed.toDouble() : 0.0,
          widget.gamesAppearences != null
              ? widget.gamesAppearences.toDouble()
              : 0.0,
          widget.gamesMinutes != null ? widget.gamesMinutes.toDouble() : 0.0,
          widget.gamesLineups != null ? widget.gamesLineups.toDouble() : 0.0,
          widget.substitutionIn != null
              ? widget.substitutionIn.toDouble()
              : 0.0,
        ]
      ];
      print(widget.substitutionIn);
      var output = List.filled(1, 0).reshape([1, 1]);
      interpreter.run(inputData, output);
      this.setState(() {
        predictionResult = output[0][0];
        print(predictionResult);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.network(widget.playerImage),
                radius: 50,
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                        text: widget.rate != null
                            ? double.parse(widget.rate).toStringAsFixed(1)
                            : '',
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      widget.rate != null
                          ? WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: Color(0xffFFB844),
                              ),
                            )
                          : WidgetSpan(child: Container()),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      WidgetSpan(
                        child: CircleAvatar(
                          child: Image.network(widget.teamLogo),
                          radius: 20,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(text: widget.playerName),
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              child: Text(
                'Stats',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 250,
            child: ListView(
              addAutomaticKeepAlives: false,
              children: [
                StatsTile(
                    leading: 'Appearences', trailing: widget.gamesAppearences),
                StatsTile(leading: 'Minutes', trailing: widget.gamesMinutes),
                StatsTile(
                    leading: 'Games Lineups ', trailing: widget.gamesLineups),
                StatsTile(
                    leading: 'Substitution In ',
                    trailing: widget.substitutionIn),

                StatsTile(leading: 'Total Shots', trailing: widget.totalShots),
                StatsTile(
                    leading: 'Shots on target', trailing: widget.shotsOnTarget),
                StatsTile(leading: 'Total Goals', trailing: widget.totalGoals),
                StatsTile(leading: 'Assists', trailing: widget.goalsAssists),
                StatsTile(leading: 'Saves', trailing: widget.goalsSaves),
                StatsTile(
                    leading: 'Goals Conceded', trailing: widget.goalsconceded),
                StatsTile(leading: 'Key Passes', trailing: widget.keyPasses),
                StatsTile(
                    leading: 'Total passes ', trailing: widget.totalPasses),
                StatsTile(
                    leading: 'Passes accuracy ',
                    trailing: widget.passesAccuracy),
                StatsTile(
                    leading: ' Dribbles', trailing: widget.dribblesSuccess),
                StatsTile(
                    leading: 'Dribbles Attempts ',
                    trailing: widget.dribblesAtetempts),

                StatsTile(
                    leading: 'Total Tackels ', trailing: widget.totalTackles),
                StatsTile(leading: 'Blocks ', trailing: widget.blockTackles),
                StatsTile(
                    leading: 'Interceptions  ', trailing: widget.interceptions),
                StatsTile(leading: 'Total Duels ', trailing: widget.totalDuels),
                StatsTile(leading: 'Won Duels ', trailing: widget.duelsWon),
                StatsTile(leading: 'Drawn Fouls ', trailing: widget.duelsWon),
                StatsTile(
                    leading: 'Committed Fouls ', trailing: widget.duelsWon),
                StatsTile(
                    leading: 'Yellow cards ', trailing: widget.yellowCards),
                StatsTile(leading: 'Penalty Won ', trailing: widget.penaltyWon),
                StatsTile(
                    leading: 'Penalty Scored ', trailing: widget.penaltyScored),
                StatsTile(
                    leading: 'Penalty Missed ', trailing: widget.penaltyMissed),

                // remember to show the percentage
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff246BFD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                child: Text(' Predict',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              onPressed: () {
                predictPerformance().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PredictionScreen(
                              playerName: widget.playerName,
                              playerImage: widget.playerImage,
                              teamLogo: widget.teamLogo,
                              predictedRate: predictionResult,
                            )),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
