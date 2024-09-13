import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:jokes_generator/constants/app_fonts.dart';
import 'package:jokes_generator/constants/app_dimensions.dart';
import 'package:jokes_generator/constants/app_durations.dart';
import 'package:jokes_generator/providers/joke_provider.dart';

class JokeTextItem extends StatelessWidget {
  const JokeTextItem({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);

    return AnimatedSwitcher(
      duration: AppDurations.shortAnimationDuration,
      child: Column(
        key: ValueKey(jokeProvider.currentJoke!.setup),
        children: [
          Text(
            textAlign: TextAlign.center,
            jokeProvider.currentJoke!.setup,
            key: ValueKey(jokeProvider.currentJoke!.setup),
            style: AppFonts.mainText,
          ).animate().fadeIn(duration: AppDurations.shortAnimationDuration),
          const SizedBox(height: AppDimensions.fifteen),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.twenty,
              vertical: AppDimensions.ten,
            ),
            child: Text(
              textAlign: TextAlign.center,
              jokeProvider.currentJoke!.punchline,
              key: ValueKey(jokeProvider.currentJoke!.punchline),
              style: AppFonts.mainText,
            ).animate().fadeIn(
                duration: AppDurations.longAnimationDuration,
                delay: AppDurations.jokePunchlineDelay),
          ),
        ],
      ),
    );
  }
}
