import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jokes_generator/providers/joke_provider.dart';

class DropdownJokeTypesButton extends StatelessWidget {
  const DropdownJokeTypesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(10),
      hint: const Text('Select joke type'),
      value: jokeProvider.selectedType,
      items: jokeProvider.jokeTypes.map((String type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        jokeProvider.setSelectedType(value);
      },
      underline: const SizedBox.shrink(),
    );
  }
}
