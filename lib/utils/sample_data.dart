import 'package:cinema/models/movie.dart';
import 'package:cinema/models/seat.dart';

final List<Movie> movies = [
  Movie(title: 'Avengers', poster: 'assets/images/avengers.jpg'),
  Movie(title: 'Runaways', poster: 'assets/images/runaways.jpg'),
  Movie(title: 'Black Panther', poster: 'assets/images/blackpanther.jpg'),
  Movie(title: 'Punisher', poster: 'assets/images/punisher.jpg'),
];

final List<Movie> trending = [
  Movie(title: 'Black Panther', poster: 'assets/images/blackpanther.jpg'),
  Movie(title: 'Punisher', poster: 'assets/images/punisher.jpg'),
  Movie(title: 'Avengers', poster: 'assets/images/avengers.jpg'),
  Movie(title: 'Runaways', poster: 'assets/images/runaways.jpg'),
  Movie(title: 'Black Panther', poster: 'assets/images/blackpanther.jpg'),
  Movie(title: 'Punisher', poster: 'assets/images/punisher.jpg'),
  Movie(title: 'Avengers', poster: 'assets/images/avengers.jpg'),
  Movie(title: 'Runaways', poster: 'assets/images/runaways.jpg'),
  Movie(title: 'Black Panther', poster: 'assets/images/blackpanther.jpg'),
  Movie(title: 'Punisher', poster: 'assets/images/punisher.jpg'),
  Movie(title: 'Avengers', poster: 'assets/images/avengers.jpg'),
  Movie(title: 'Runaways', poster: 'assets/images/runaways.jpg'),
];

List<List<Seat>> generateSeats() {
  return List.generate(10, (i) => List.generate(7, (j) => Seat(number: 7 * i + j + 1)));
}