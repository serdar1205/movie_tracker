import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_tracker/core/config/theme_cubit/theme_cubit.dart';
import 'package:movie_tracker/features/data/datasources/remote/app_mode_remote_datasource.dart';
import 'package:movie_tracker/features/data/repositories/app_mode_repository.dart';
import 'package:movie_tracker/features/presentation/blocs/app_mode_bloc/app_mode_bloc.dart';
import 'package:movie_tracker/features/presentation/blocs/movies_bloc/movies_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);
  locator.registerLazySingleton<AppModeRemoteDatasource>(() => AppModeRemoteDatasourceImpl(locator()));
  locator.registerLazySingleton<AppModeRepository>(() =>
      AppModeRepository(locator()));
  locator.registerLazySingleton(() => ThemeCubit());

  locator.registerLazySingleton(() => AppModeBloc(locator()));

  locator.registerLazySingleton(() => MoviesBloc());
}
