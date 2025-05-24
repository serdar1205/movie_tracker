part of 'movies_bloc.dart';

sealed class MoviesEvent {}

class AddMovie extends MoviesEvent {
  final MovieModel movie;

  AddMovie(this.movie);
}
