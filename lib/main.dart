import 'package:flutter/material.dart';
import 'package:jokes_generator/injection/get_it.dart';
import 'package:jokes_generator/theme/app_theme.dart';

import 'package:provider/provider.dart';
import 'providers/joke_provider.dart';
import 'screens/joke_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<JokeProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jokes & Dogs',
        theme: AppTheme.darkTheme,
        home: const JokeScreen(),
      ),
    );
  }
}
