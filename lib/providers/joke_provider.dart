import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:jokes_generator/models/joke_model.dart';

class JokeProvider extends ChangeNotifier {
  List<String> jokeTypes = [];
  String? selectedType;
  Joke? currentJoke;
  String? dogImageUrl;
  bool isLoading = false;

  JokeProvider() {
    fetchJokeTypes();
  }

  Future<void> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/types'));
    if (response.statusCode == 200) {
      jokeTypes = List<String>.from(json.decode(response.body));
      notifyListeners();
    }
  }

  Future<void> fetchJokeAndDog() async {
    if (selectedType == null) return;

    isLoading = true;
    notifyListeners();

    final jokeResponse = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/jokes/$selectedType/random'));
    if (jokeResponse.statusCode == 200) {
      final jokeList = json.decode(jokeResponse.body) as List<dynamic>;
      currentJoke = Joke.fromJson(jokeList[0]);
    }

    final dogResponse = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (dogResponse.statusCode == 200) {
      dogImageUrl = json.decode(dogResponse.body)['message'];
    }

    isLoading = false;
    notifyListeners();
  }

  void setSelectedType(String? type) {
    selectedType = type;
    notifyListeners();
  }
}
