import 'package:flutter/material.dart';
import '../providers/leagues.dart';
import '../providers/teams.dart';
import '../widgets/teams_grid.dart';
import 'package:provider/provider.dart';

class TeamsScreen extends StatefulWidget {
  static const routeName = '/teams-screen';

  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  var leagueId;
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        leagueId = ModalRoute.of(context).settings.arguments as int;
      });

      Provider.of<Teams>(context, listen: false).fetchTeams(leagueId).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final leaguesId = ModalRoute.of(context).settings.arguments as int;
    final loadedLeague = Provider.of<Leagues>(
      context,
      listen: false,
    ).findById(leaguesId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedLeague.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        backgroundColor: Theme.of(context).primaryColor,
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
                  _isLoading = true;

                  Provider.of<Teams>(context, listen: false)
                      .teamsBySeason(loadedLeague.name, 2020)
                      .then((_) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                });
              } else if (itemIdentifier == 2019) {
                setState(() {
                  _isLoading = true;

                  Provider.of<Teams>(context, listen: false)
                      .teamsBySeason(loadedLeague.name, 2019)
                      .then((_) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                });
              } else if (itemIdentifier == 2018) {
                setState(() {
                  _isLoading = true;

                  Provider.of<Teams>(context, listen: false)
                      .teamsBySeason(loadedLeague.name, 2018)
                      .then((_) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                });
              } else if (itemIdentifier == 2017) {
                setState(() {
                  _isLoading = true;

                  Provider.of<Teams>(context, listen: false)
                      .teamsBySeason(loadedLeague.name, 2017)
                      .then((_) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                });
              } else if (itemIdentifier == 2016) {
                setState(() {
                  _isLoading = true;

                  Provider.of<Teams>(context, listen: false)
                      .teamsBySeason(loadedLeague.name, 2016)
                      .then((_) {
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
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: TeamsGrid(),
            ),
      backgroundColor: Colors.black,
    );
  }
}
