import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:movie_tracker/features/data/models/movie_model.dart';
import 'package:movie_tracker/features/presentation/pages/details_page/details_page.dart';
import 'package:movie_tracker/features/presentation/pages/main_page/main_page.dart';
import 'routes_path.dart';
import 'widget_keys_srt.dart';

final goRouter = GoRouter(
  initialLocation: AppRoutes.mainPage,
  navigatorKey: rootNavKey,
  routes: [
    GoRoute(
      path: AppRoutes.mainPage,
      builder: (context, state) {
        return MainPage();
      },
    ),
    GoRoute(
      path: AppRoutes.detailsPage,
      builder: (context, state) {
        if (state.extra != null && state.extra is Map<String, dynamic>) {
          final extra = state.extra as Map<String, dynamic>;
          final MovieModel model = extra['model'];

          return DetailsPage(movie: model);
        } else {
          return Scaffold(
              appBar: AppBar(),
              body: Center(child: Text(AppStrings.notFoundPage)));
        }
      },
    ),
  ],
);
