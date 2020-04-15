import 'package:flutter/material.dart';
import 'package:cinema/widgets/movie_card_large.dart';
import 'package:cinema/widgets/movie_card_small.dart';
import 'package:cinema/widgets/shared_drawer.dart';
import 'package:cinema/utils/sample_data.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SharedDrawer(),
      appBar: AppBar(
        title: Text('title').tr(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              'movies',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'SF-Pro-Display-Bold',
              ),
            ).tr(),
          ),
          Container(
            height: 320.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext _, int index) =>
                  MovieCardLarge(movies[index]),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              'trending',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'SF-Pro-Display-Bold',
              ),
            ).tr(),
          ),

          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (BuildContext _, int index) =>
                  MovieCardSmall(trending[index]),
            ),
          ),
        ],
      ),
    );
  }
}
