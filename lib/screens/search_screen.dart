import 'package:flutter/material.dart';
import 'package:player_performance_predictor/widgets/search_result.dart';
import '../widgets/search_from.dart';
import 'package:provider/provider.dart';
import '../providers/players.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query;

  @override
  Widget build(BuildContext context) {
    final playerCard = Provider.of<Players>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchForm(
              onSearch: (q) {
                setState(() {
                  query = q;
                });
              },
            ),
            query == null
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 110,
                        ),
                        Text(
                          'No results to display',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                : FutureBuilder(
                    future: playerCard.searchforPlayers(query),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasData) {
                        return Expanded(
                          flex: 2,
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, i) {
                                return SearchResult(snapshot.data[i]);
                              }),
                        );
                      }

                      return Text(
                          'Error retrieving results: ${snapshot.error}');
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
