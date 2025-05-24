import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:movie_tracker/features/data/models/movie_model.dart';
import 'package:movie_tracker/features/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:movie_tracker/features/presentation/widgets/bottom_sheet.dart';
import 'package:movie_tracker/features/presentation/widgets/item_card.dart';
import 'package:movie_tracker/features/presentation/pages/main_page/components/settings_widget.dart';
import 'components/add_item_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
        actions: [
          IconButton(
              onPressed: () {
                bottomSheetWidget(context, ThemeSettingsSheet());
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                bottomSheetWidget(context, AddItemWidget());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return switch (state) {
            MoviesInitial() => Center(child: Text(AppStrings.addMovie)),
            MoviesLoaded(:final data) => ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ItemCard(
                    model: MovieModel(
                      title: item.title,
                      description: item.description,
                      hasSeen: item.hasSeen,
                    ),
                  );
                }),
          };
        },
      ),
    );
  }
}
