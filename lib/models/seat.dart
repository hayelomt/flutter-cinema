import 'package:flutter/foundation.dart';
enum SeatState { Available, Selected, Reserved }

class Seat {
  int number;
  SeatState seatState;

  Seat({@required this.number, this.seatState = SeatState.Available});
}