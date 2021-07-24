import 'package:flutter/material.dart';
import '../modals/player.dart';
import '../screens/player_stats.dart';
import 'package:provider/provider.dart';

class PlayerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<Player>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          PlayerStats.routeName,
          arguments: player.playerId,
        );
      },
      child: Card(
        elevation: 6,
        // color: Color(0xffDCEAEB),
        color: Color(0xff1C1C1E),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                player.playerImage,
                height: 90,
                width: 90,
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        child: Wrap(children: [
                          Text(
                            player.playerName ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                      Text(
                        player.rate != null
                            ? double.parse(player.rate).toStringAsFixed(1)
                            : '',
                        style: TextStyle(
                          fontSize: 17.0,
                          //  color: Color(0xff254029),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      player.rate != null
                          ? Icon(
                              Icons.star,
                              color: Color(0xffFFB844),
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff90A49B),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          player.age.toString() ?? '',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff90A49B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nationality',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff90A49B),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          width: 90,
                          child: Text(
                            player.nationality ?? '',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xff90A49B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Position',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff90A49B),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          player.position ?? '',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff90A49B),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
