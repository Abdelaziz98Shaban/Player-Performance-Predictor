import 'package:flutter/material.dart';
import 'package:player_performance_predictor/providers/players.dart';
import 'package:player_performance_predictor/widgets/app_drawer.dart';
import 'package:player_performance_predictor/widgets/player_stats_item.dart';
import 'package:provider/provider.dart';

class PlayerStats extends StatefulWidget {
  static const routeName = '/playerstats-screen';

  @override
  _PlayerStatsState createState() => _PlayerStatsState();
}

class _PlayerStatsState extends State<PlayerStats> {
  var _isLoading = false;
  var playerid;
  var player;
  var season = 2020;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        playerid = ModalRoute.of(context).settings.arguments as int;
      });

      Provider.of<Players>(context, listen: false)
          .fetchplayerStatistics(playerid, season)
          .then((_) {
        player = Provider.of<Players>(
          context,
          listen: false,
        ).findById(playerid);
        setState(() {
          _isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            drawer: AppDrawer(),
            appBar: AppBar(
              title: Text('Statistics',
                  style: Theme.of(context).textTheme.bodyText1),
              actions: [
                PopupMenuButton(
                  itemBuilder: (BuildContext ctx) => [
                    PopupMenuItem(
                      child: Text(
                        'Season 2020',
                      ),
                      value: 2020,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Season 2019',
                      ),
                      value: 2019,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Season 2018',
                      ),
                      value: 2018,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Season 2017',
                      ),
                      value: 2017,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Season 2016',
                      ),
                      value: 2016,
                    ),
                  ],
                  onSelected: (itemIdentifier) {
                    if (itemIdentifier == 2020) {
                      setState(() {
                        season = 2020;
                        _isLoading = true;

                        Provider.of<Players>(context, listen: false)
                            .fetchplayerStatistics(playerid, season)
                            .then((_) {
                          player = Provider.of<Players>(
                            context,
                            listen: false,
                          ).findById(playerid);
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      });
                    } else if (itemIdentifier == 2019) {
                      setState(() {
                        season = 2019;

                        _isLoading = true;

                        Provider.of<Players>(context, listen: false)
                            .fetchplayerStatistics(playerid, season)
                            .then((_) {
                          player = Provider.of<Players>(
                            context,
                            listen: false,
                          ).findById(playerid);
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      });
                    } else if (itemIdentifier == 2018) {
                      setState(() {
                        season = 2018;
                        _isLoading = true;

                        Provider.of<Players>(context, listen: false)
                            .fetchplayerStatistics(playerid, season)
                            .then((_) {
                          player = Provider.of<Players>(
                            context,
                            listen: false,
                          ).findById(playerid);
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      });
                    } else if (itemIdentifier == 2017) {
                      setState(() {
                        season = 2017;
                        _isLoading = true;

                        Provider.of<Players>(context, listen: false)
                            .fetchplayerStatistics(playerid, season)
                            .then((_) {
                          player = Provider.of<Players>(
                            context,
                            listen: false,
                          ).findById(playerid);
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      });
                    } else if (itemIdentifier == 2016) {
                      setState(() {
                        season = 2016;
                        _isLoading = true;

                        Provider.of<Players>(context, listen: false)
                            .fetchplayerStatistics(playerid, season)
                            .then((_) {
                          player = Provider.of<Players>(
                            context,
                            listen: false,
                          ).findById(playerid);
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      });
                    }
                  },
                ),
              ],
            ),
            body: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    color: Color(0xff1C1C1E),
                    height: MediaQuery.of(context).size.height,
                    child: PlayerStatsItem(
                      playerName: player.playerName,
                      playerImage: player.playerImage,
                      rate: player.rate,
                      totalGoals: player.totalGoals,
                      goalsAssists: player.goalsAssists,
                      gamesAppearences: player.gamesAppearences,
                      gamesMinutes: player.gamesMinutes,
                      teamLogo: player.teamLogo,
                      totalShots: player.totalShots,
                      shotsOnTarget: player.shotsOnTarget,
                      totalPasses: player.totalPasses,
                      passesAccuracy: player.passesAccuracy,
                      keyPasses: player.keyPasses,
                      totalTackles: player.totalTackles,
                      blockTackles: player.blockTackles,
                      totalDuels: player.totalDuels,
                      duelsWon: player.duelsWon,
                      dribblesSuccess: player.dribblesSuccess,
                      dribblesAtetempts: player.dribblesAtetempts,
                      goalsSaves: player.goalsSaves,
                      goalsconceded: player.goalsconceded,
                      foulsDrawn: player.foulsDrawn,
                      foulsCommitted: player.foulsCommitted,
                      interceptions: player.interceptions,
                      yellowCards: player.yellowCards,
                      redCards: player.redCards,
                      penaltyWon: player.penaltyWon,
                      penaltyScored: player.penaltyScored,
                      penaltyMissed: player.penaltyMissed,
                      substitutionIn: player.substitutionIn,
                      gamesLineups: player.gamesLineups,
                    ),
                  ),
          );
  }
}
