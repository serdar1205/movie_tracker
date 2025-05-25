import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/features/presentation/blocs/app_mode_bloc/app_mode_bloc.dart';

import 'main_page/main_page.dart';
import 'web_page/web_page.dart';

class AppModePage extends StatelessWidget {
  const AppModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppModeBloc, AppModeState>(
      builder: (context, state) {
        if (state is AppModeLoaded) {
          if (state.data.mode == 'production') {
            return WebPage(
              url: state.data.productionUrl,
            );
          } else {
            return MainPage();
          }
        } else if (state is AppModeError) {
          return Scaffold(
            body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                                state.message,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                )),
          );
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
