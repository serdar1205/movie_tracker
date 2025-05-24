import 'package:flutter/material.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:movie_tracker/features/data/models/movie_model.dart';

class DetailsPage extends StatelessWidget {
  final MovieModel movie;

  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final status = movie.hasSeen ? AppStrings.seen : AppStrings.notSeen;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.details),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(AppStrings.status,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(status),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                '${AppStrings.review}:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                movie.description.isNotEmpty
                    ? movie.description
                    : AppStrings.notReview,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
