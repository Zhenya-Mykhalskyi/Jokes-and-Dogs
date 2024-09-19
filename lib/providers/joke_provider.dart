import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:jokes_generator/models/joke_model.dart';
import 'package:jokes_generator/services/dog_image_service.dart';
import 'package:jokes_generator/services/joke_service.dart';

@injectable
class JokeProvider extends ChangeNotifier {
  final JokeService jokeService;
  final DogImageService dogImageService;

  List<String> jokeTypes = [];
  String? selectedType;
  Joke? currentJoke;
  String? dogImageUrl;
  bool isLoading = false;

  JokeProvider(this.jokeService, this.dogImageService) {
    fetchJokeTypes();
  }

  Future<void> fetchJokeTypes() async {
    jokeTypes = await jokeService.fetchJokeTypes();
    notifyListeners();
  }

  Future<void> fetchJokeAndDog() async {
    if (selectedType == null) return;

    isLoading = true;
    notifyListeners();

    currentJoke = await jokeService.fetchJoke(selectedType!);
    dogImageUrl = await dogImageService.fetchDogImage();

    isLoading = false;
    notifyListeners();
  }

  void setSelectedType(String? type) {
    selectedType = type;
    notifyListeners();
  }
}
