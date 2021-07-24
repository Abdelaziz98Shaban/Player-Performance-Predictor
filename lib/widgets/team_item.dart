import 'package:flutter/material.dart';
import '../modals/team.dart';
import '../screens/squad_screen.dart';
import 'package:provider/provider.dart';

class TeamItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final team = Provider.of<Team>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              SquadScreen.routeName,
              arguments: team.teamId,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1C1C1E),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Image.network(
                      team.teamLogo,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      team.teamName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

/* Container(
            decoration: BoxDecoration(
              color: Color(0xffDCEAEB),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
          ), */