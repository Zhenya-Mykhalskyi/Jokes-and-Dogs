import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jokes_generator/constants/app_dimensions.dart';
import 'package:jokes_generator/constants/app_fonts.dart';
import 'package:jokes_generator/constants/app_colors.dart';
import 'package:jokes_generator/providers/joke_provider.dart';

class GenerateJokeButton extends StatelessWidget {
  const GenerateJokeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);
    return ElevatedButton(
      onPressed: jokeProvider.selectedType == null || jokeProvider.isLoading
          ? null
          : () => jokeProvider.fetchJokeAndDog(),
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.buttonsColor,
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.fifteen),
        ),
      ),
      child: const Text(
        'Пошутить',
        style: AppFonts.actionButtonText,
      ),
    );
  }
}
