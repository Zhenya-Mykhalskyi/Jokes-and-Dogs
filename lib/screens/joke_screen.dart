import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jokes_generator/constants/app_fonts.dart';
import 'package:jokes_generator/constants/app_dimensions.dart';
import 'package:jokes_generator/providers/joke_provider.dart';
import 'package:jokes_generator/widgets/buttons/dropdown_joke_types_button.dart';
import 'package:jokes_generator/widgets/buttons/generate_joke_button.dart';
import 'package:jokes_generator/widgets/joke_image_item.dart';
import 'package:jokes_generator/widgets/joke_text_item.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes & Dogs', style: AppFonts.logoText),
        centerTitle: false,
        actions: const [
          DropdownJokeTypesButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.twenty),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: AppDimensions.fortyFive),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (jokeProvider.currentJoke != null) const JokeTextItem(),
                  const SizedBox(height: AppDimensions.fortyFive),
                  const JokeImageItem(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppDimensions.twenty, vertical: AppDimensions.twenty),
        child: GenerateJokeButton(),
      ),
    );
  }
}
