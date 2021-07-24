import 'package:flutter/material.dart';
import 'package:player_performance_predictor/widgets/app_drawer.dart';

class PredictionScreen extends StatelessWidget {
  static const routeName = '/predict-screen';

  final String playerImage;
  final String teamLogo;
  final String playerName;
  final double predictedRate;

  PredictionScreen({
    @required this.playerImage,
    @required this.playerName,
    @required this.teamLogo,
    @required this.predictedRate,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Development Sheet',
            style: Theme.of(context).textTheme.bodyText1),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.network(playerImage)),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 20,
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
                                child: Image.network(teamLogo),
                                radius: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 8,
                              ),
                            ),
                            TextSpan(text: playerName),
                          ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expected Rate',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              TextSpan(
                                text: predictedRate != null
                                    ? predictedRate.toStringAsFixed(1)
                                    : '',
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 10,
                                ),
                              ),
                              predictedRate != null
                                  ? WidgetSpan(
                                      child: Icon(
                                        Icons.star,
                                        color: Color(0xffFFB844),
                                      ),
                                    )
                                  : WidgetSpan(child: Container()),
                            ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    child: Text(
                      'Progress',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: (predictedRate != null && predictedRate > 7.5)
                        ? Image.asset(
                            'assets/pics/graphs/developing.jpeg',
                            height: 150.0,
                            width: 100.0,
                          )
                        : Image.asset(
                            'assets/pics/graphs/loosingit.jpeg',
                            height: 150.0,
                            width: 100.0,
                          ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
