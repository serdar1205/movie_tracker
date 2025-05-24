import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tracker/core/config/theme_cubit/theme_cubit.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';

class ThemeSettingsSheet extends StatelessWidget {
  const ThemeSettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state.themeMode;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.selectTheme,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                themeMode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (isDark) {
                  final themeCubit = context.read<ThemeCubit>();
                  themeCubit
                      .updateTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
