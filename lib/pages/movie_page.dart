import 'package:cinema/models/actor.dart';
import 'package:cinema/models/movie.dart';
import 'package:cinema/pages/ticket_page.dart';
import 'package:cinema/widgets/actor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';

class MoviePage extends StatelessWidget {
  static const routeName = 'movie_page';
  final Movie _movie =
      Movie(title: 'Punisher', poster: 'assets/images/banner.png');
  final List<Actor> _actors = [
    Actor(name: 'Robert', avatar: 'assets/images/robert.jpeg'),
    Actor(name: 'Harvey', avatar: 'assets/images/harvey.jpeg'),
    Actor(name: 'Pesci', avatar: 'assets/images/pesci.jpeg'),
    Actor(name: 'Ray', avatar: 'assets/images/ray.jpeg'),
    Actor(name: 'Anna', avatar: 'assets/images/anna.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            floating: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                child: Image.asset(
                  _movie.poster,
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Drama,Crime',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _movie.title,
                      style: TextStyle(
                        fontFamily: 'SF-Pro-Display-Bold',
                        fontSize: 30.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: List.generate(
                              5,
                              (i) => Icon(Icons.star,
                                  color: Colors.pink, size: 15.0)),
                        ),
                        Text(
                          '3h 30min',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'The first film, known simply as The Punisher is a film'
                      'that was released straight to video by New World Pictures '
                      'in 1989 that is most notable for lacking the character\'s'
                      'signature skull. Marvel hired Jonathan Hensleigh to write'
                      'and direct the 2004 film starring Thomas Jane.',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'cast',
                      style: TextStyle(
                        fontFamily: 'SF-Pro-Display-Bold',
                        fontSize: 20.0,
                      ),
                    ).tr(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _actors.length,
                        itemBuilder: (_, int index) =>
                            ActorCard(_actors[index]),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(TicketPage.routeName);
                          },
                          color: Color(0xFFE52020),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 60.0),
                          child: Text(
                            "buy_ticket",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "SF-Pro-Display-Bold"),
                          ).tr(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
