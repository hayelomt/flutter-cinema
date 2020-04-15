import 'package:cinema/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCardSmall extends StatelessWidget {
  final Movie movie;

  MovieCardSmall(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
      child: Container(
//        height: 160.0,
        width: 115.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Image.asset(
                movie.poster,
                width: double.infinity,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "SF-Pro-Display-Bold",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}