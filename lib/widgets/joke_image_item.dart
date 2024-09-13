import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:jokes_generator/constants/app_dimensions.dart';
import 'package:jokes_generator/constants/app_durations.dart';
import 'package:jokes_generator/providers/joke_provider.dart';

class JokeImageItem extends StatelessWidget {
  const JokeImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);
    return AnimatedSwitcher(
      duration: AppDurations.shortAnimationDuration,
      child: jokeProvider.dogImageUrl != null
          ? ClipRRect(
              key: ValueKey(jokeProvider.dogImageUrl),
              borderRadius: BorderRadius.circular(AppDimensions.ten),
              child: Image.network(
                jokeProvider.dogImageUrl!,
                height: AppDimensions.twoHundred,
                width: AppDimensions.twoHundred,
                fit: BoxFit.cover,
              ).animate().fadeIn(
                  duration: AppDurations.longAnimationDuration,
                  delay: AppDurations.jokePunchlineDelay),
            )
          : const SizedBox.shrink(),
    );
  }
}
