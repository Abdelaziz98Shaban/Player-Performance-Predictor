import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/players.dart';
import '../widgets/player_card.dart';

class SquadScreen extends StatefulWidget {
  static const routeName = '/playerscards-screen';

  @override
  _SquadScreenState createState() => _SquadScreenState();
}

class _SquadScreenState extends State<SquadScreen> {
  var teamId;
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        teamId = ModalRoute.of(context).settings.arguments as int;
      });

      Provider.of<Players>(context, listen: false)
          .fetchteamsSquad(teamId)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final playerCard = Provider.of<Players>(context).playerItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Squad', style: Theme.of(context).textTheme.bodyText1),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: playerCard.length,
                  itemBuilder: (context, i) => ChangeNotifierProvider.value(
                    value: playerCard[i],
                    child: PlayerCard(),
                  ),
                ),
              ),
            ),
      backgroundColor: Colors.black,
    );
  }
}
