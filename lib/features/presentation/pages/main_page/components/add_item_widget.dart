import 'package:flutter/material.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:movie_tracker/features/data/models/movie_model.dart';
import 'package:movie_tracker/features/locator.dart';
import 'package:movie_tracker/features/presentation/blocs/movies_bloc/movies_bloc.dart';
import '../../../widgets/k_textfield.dart';

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({super.key});

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _hasSeen = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty) return;

    locator<MoviesBloc>().add(
      AddMovie(
        MovieModel(
          title: title,
          description: description,
          hasSeen: _hasSeen,
        ),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.addMovie,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          KTextField(
            controller: _titleController,
            labelText: AppStrings.movieTitle,
          ),
          const SizedBox(height: 12),
          KTextField(
            controller: _descriptionController,
            labelText: AppStrings.review,
            maxLines: 5,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(AppStrings.seen),
              Switch(
                value: _hasSeen,
                onChanged: (val) => setState(() => _hasSeen = val),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _submit,
            child: const Text(AppStrings.addMovie),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
