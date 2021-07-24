import 'package:flutter/foundation.dart';

class League with ChangeNotifier {
  final String logo;
  final int id;
  final String name;
  League({this.logo, this.id, this.name});
}
