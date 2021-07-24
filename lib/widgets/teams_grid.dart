import 'package:flutter/material.dart';
import '../providers/teams.dart';
import 'team_item.dart';
import 'package:provider/provider.dart';

class TeamsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<Teams>(context).teamItems;
    return GridView.builder(
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: teams[i],
        child: TeamItem(),
      ),
      itemCount: teams.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.8 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
