import 'package:flutter/material.dart';
import '../modals/league.dart';
import '../screens/teams_screen.dart';
import 'package:provider/provider.dart';

class LeagueItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final league = Provider.of<League>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              TeamsScreen.routeName,
              arguments: league.id,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1C1C1E),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Container(
                      child: Image.asset(
                    league.logo,
                  )),
                ),
                Text(
                  league.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
