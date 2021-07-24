import 'package:flutter/material.dart';
import 'package:player_performance_predictor/screens/player_stats.dart';

class SearchResult extends StatelessWidget {
  final dynamic searchResult;
  SearchResult(this.searchResult);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            PlayerStats.routeName,
            arguments: searchResult['player_id'] as int,
          );
        },
        child: Card(
          color: Colors.black,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.black,
                child: Icon(
                  Icons.person_pin,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        searchResult['player_name'] ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 17,
                          ),
                          SizedBox(width: 5),
                          Text(
                            searchResult['nationality'] ?? '',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Text(
                        searchResult['position'] ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
