import 'package:cinema/models/actor.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final Actor _actor;

  ActorCard(this._actor);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: double.infinity,
              child: Image.asset(
                _actor.avatar,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              _actor.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
