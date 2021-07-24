import 'package:flutter/material.dart';
import 'package:player_performance_predictor/screens/search_screen.dart';
import 'providers/leagues.dart';
import 'providers/players.dart';
import 'providers/teams.dart';
import 'screens/player_stats.dart';
import 'screens/squad_screen.dart';
import 'screens/teams_screen.dart';
import 'screens/leagues_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Leagues(),
        ),
        ChangeNotifierProvider(
          create: (context) => Teams(),
        ),
        ChangeNotifierProvider(
          create: (context) => Players(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Player Performance Predictor',
        theme: ThemeData(
            primaryColor: Color(0xff1C1C1E),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  bodyText2: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  headline2: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                  headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Color(0xff246BFD),
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        home: SplashScreen(
          backgroundColor: Color(0xff222232),
          photoSize: 100,
          image: Image.asset('assets/pics/junior_soccer.png'),
          seconds: 5,
          title: Text(
            'Player Performance Predictor ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          navigateAfterSeconds: LeaguesScreen(),
        ),
        routes: {
          LeaguesScreen.routeName: (ctx) => LeaguesScreen(),
          TeamsScreen.routeName: (ctx) => TeamsScreen(),
          SquadScreen.routeName: (ctx) => SquadScreen(),
          PlayerStats.routeName: (ctx) => PlayerStats(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
        },
      ),
    );
  }
}
