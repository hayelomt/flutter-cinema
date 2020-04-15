import 'package:cinema/models/movie.dart';
import 'package:cinema/models/seat.dart';
import 'package:cinema/pages/home_page.dart';
import 'package:cinema/utils/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TicketPage extends StatelessWidget {
  static String routeName = 'ticket_page';

  final Movie _movie =
      Movie(title: 'Punisher', poster: 'assets/images/banner.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TicketPageHead(title: _movie.title),
                    SizedBox(height: 15.0),
                    CinemaSeats(),
                    SizedBox(height: 15.0),
                    SeatIndicator(),
                    SizedBox(height: 15.0),
                    Center(
                      child: RaisedButton(
                        color: Colors.pink,
                        onPressed: () {
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              content: Text('purchase_success').tr(),
                              actions: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
                                  },
                                  child: Text('done').tr()
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            'checkout',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ).tr(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: Colors.pink),
                child: Text(
                  'Tickets',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SeatIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
            ),
            Text(
              'selected',
              style: TextStyle(fontWeight: FontWeight.bold),
            ).tr(),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black87,
              ),
            ),
            Text(
              'reserved',
              style: TextStyle(fontWeight: FontWeight.bold),
            ).tr(),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Text(
              'available',
              style: TextStyle(fontWeight: FontWeight.bold),
            ).tr(),
          ],
        ),
      ],
    );
  }
}

class TicketPageHead extends StatelessWidget {
  final String title;

  TicketPageHead({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          title,
          style: TextStyle(
            fontFamily: 'SF-Pro-Display-Bold',
            fontSize: 30.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.location_on),
                Text(
                  'Cinema Ethiopia',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
      ],
    );
  }
}

class CinemaSeats extends StatefulWidget {
  @override
  _CinemaSeatsState createState() => _CinemaSeatsState();
}

class _CinemaSeatsState extends State<CinemaSeats> {
  List<List<Seat>> _seats;

  @override
  void initState() {
    super.initState();

    setState(() {
      _seats = generateSeats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _seats.map(
        (List<Seat> curSeat) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: curSeat
                .map((Seat seat) => GestureDetector(
                    onTap: () {
                      if (seat.seatState == SeatState.Available) {
                        setState(() {
                          seat.seatState = SeatState.Selected;
                        });
                      } else if (seat.seatState == SeatState.Selected) {
                        setState(() {
                          seat.seatState = SeatState.Available;
                        });
                      }
                    },
                    child: SeatCard(seat)))
                .toList(),
          );
        },
      ).toList(),
    );
  }
}

class SeatCard extends StatelessWidget {
  final Seat _seat;

  SeatCard(this._seat);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: _seat.seatState == SeatState.Selected
            ? Colors.pink
            : _seat.seatState == SeatState.Available
                ? Colors.grey
                : Colors.black87,
      ),
    );
  }
}
