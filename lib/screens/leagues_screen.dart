import 'package:flutter/material.dart';
import 'package:player_performance_predictor/screens/search_screen.dart';
import 'package:player_performance_predictor/widgets/app_drawer.dart';
import '../widgets/league_grid.dart';

class LeaguesScreen extends StatelessWidget {
  static const routeName = '/leagues';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          '  LEAGUES',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
          ),
          /* PopupMenuButton(
            itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            onSelected: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                //   FirebaseAuth.instance.signOut();
              }
            },
          ), */
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LeagueGrid(),
      ),
      backgroundColor: Colors.black,
    );
  }
}
