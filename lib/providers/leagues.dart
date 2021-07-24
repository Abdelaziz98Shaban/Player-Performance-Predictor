import 'package:flutter/foundation.dart';
import '../modals/league.dart';

class Leagues with ChangeNotifier {
  List<League> _leagueItems = [
    League(
      id: 2790,
      name: 'Premier League',
      logo: 'assets/pics/leagues/epl.jpg',
    ),
    League(
      id: 2833,
      name: 'LaLiga',
      logo: 'assets/pics/leagues/laliga.jpg',
    ),
    League(
      id: 2755,
      name: 'Bundesliga 1',
      logo: 'assets/pics/leagues/bundesliga.jpg',
    ),
    League(
      id: 2857,
      name: 'Serie A',
      logo: 'assets/pics/leagues/seria.jpg',
    ),
    League(
      id: 2664,
      name: 'Ligue 1',
      logo: 'assets/pics/leagues/ligue.jpg',
    ),
    League(
      id: 126,
      name: 'Egyptian League',
      logo: 'assets/pics/leagues/egyleague.jpg',
    ),
  ];

  List<League> get leagueItems {
    return [..._leagueItems];
  }

  League findById(int id) {
    return _leagueItems.firstWhere((league) => league.id == id);
  }

  /*  Future<void> fetchLeagues() async {
    const url =
        "https://api.thingspeak.com/apps/thinghttp/send_request?api_key=FTV3VJ24N1T5NV7J";
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var leagueData = extractedData['api']['leagues'] as List;

      if (extractedData == null) {
        return;
      }
      final List<League> loadedLeagues = [];
      leagueData.forEach((league) {
        loadedLeagues.add(
          League(
              id: league['league_id'],
              name: league['name'],
              logo: league['logo']),
        );
      });
      _leagueItems = loadedLeagues;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  } */
}
