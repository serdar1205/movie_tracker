part of 'movies_bloc.dart';

sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoaded extends MoviesState {

  final List<MovieModel> data;

  MoviesLoaded(this.data);
}
