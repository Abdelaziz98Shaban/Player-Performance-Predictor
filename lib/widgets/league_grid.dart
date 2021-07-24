import 'package:flutter/material.dart';
import '../providers/leagues.dart';
import 'league_item.dart';
import 'package:provider/provider.dart';

class LeagueGrid extends StatefulWidget {
  @override
  _LeagueGridState createState() => _LeagueGridState();
}

class _LeagueGridState extends State<LeagueGrid> {
  @override
  Widget build(BuildContext context) {
    final league = Provider.of<Leagues>(context).leagueItems;
    return GridView.builder(
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: league[i],
        child: LeagueItem(),
      ),
      itemCount: league.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2.5 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
