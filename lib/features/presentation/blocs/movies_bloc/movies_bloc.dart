import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/features/data/models/movie_model.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final List<MovieModel> _movies = List.empty(growable: true);

  MoviesBloc() : super(MoviesInitial()) {
    on<AddMovie>(_onGetAllCharacters);
  }

  Future<void> _onGetAllCharacters(
      AddMovie event, Emitter<MoviesState> emit) async {
    _movies.insert(0, event.movie);
    emit(MoviesLoaded(List.from(_movies)));
  }
}
