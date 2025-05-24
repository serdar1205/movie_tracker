import 'package:get_it/get_it.dart';
import 'package:movie_tracker/core/config/theme_cubit/theme_cubit.dart';
import 'package:movie_tracker/features/presentation/blocs/movies_bloc/movies_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerLazySingleton(() => ThemeCubit());
  locator.registerLazySingleton(() => MoviesBloc());
}
