import 'package:flutter/material.dart';

class Team with ChangeNotifier {
  final int teamId;
  final String teamLogo;
  final String teamName;

  Team(
      {@required this.teamId,
      @required this.teamLogo,
      @required this.teamName});
}
