import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_tracker/core/config/routes/routes_path.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:movie_tracker/features/data/models/movie_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.model,
  });

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    final status = model.hasSeen ? AppStrings.seen : AppStrings.notSeen;

    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.detailsPage, extra: {'model': model});
      },
      child: Card(
        elevation: 3,
        color: Theme.of(context).cardColor,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  model.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(width: 12),
              Chip(
                label: Text(
                  status,
                  style: TextStyle(
                    color: model.hasSeen ? Colors.green : Colors.orange,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                backgroundColor:
                    model.hasSeen ? Colors.green[50] : Colors.orange[50],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
