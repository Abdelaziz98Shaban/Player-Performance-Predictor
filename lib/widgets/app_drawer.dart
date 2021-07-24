import 'package:flutter/material.dart';
import 'package:player_performance_predictor/screens/leagues_screen.dart';
import 'package:player_performance_predictor/screens/search_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('PPP'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.sports_soccer,
                color: Colors.white,
              ),
              title: Text('Leagues '),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(LeaguesScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text('Search'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SearchScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
