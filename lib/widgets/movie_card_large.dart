import 'package:cinema/pages/movie_page.dart';
import 'package:flutter/material.dart';
import 'package:cinema/models/movie.dart';

class MovieCardLarge extends StatelessWidget {
  final Movie movie;

  MovieCardLarge(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(MoviePage.routeName),
      child: Container(
        height: 320,
        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Image.asset(
                  movie.poster,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Column(
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        5,
                            (index) =>
                            Icon(Icons.star, size: 20, color: Colors.pink)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
