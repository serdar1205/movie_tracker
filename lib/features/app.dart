import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:movie_tracker/features/presentation/blocs/movies_bloc/movies_bloc.dart';
import '../core/config/routes/app_router.dart';
import '../core/config/theme/app_theme.dart';
import '../core/config/theme_cubit/theme_cubit.dart';

import 'locator.dart';

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (context) => locator<ThemeCubit>()),
          BlocProvider<MoviesBloc>.value(value: locator<MoviesBloc>()),
        ],
        child: Builder(builder: (context) {
          final themeState =
              context.select((ThemeCubit cubit) => cubit.state.themeMode);
          return MaterialApp.router(
            title: AppStrings.appName,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            debugShowCheckedModeBanner: false,
            themeMode: themeState,
            routerConfig: goRouter,
          );
        }));
  }
}
