import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:jokes_generator/models/joke_model.dart';

@injectable
class JokeService {
  Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  Future<Joke> fetchJoke(String type) async {
    final response =
        await http.get(Uri.parse('https://official-joke-api.appspot.com/jokes/$type/random'));
    if (response.statusCode == 200) {
      final jokeList = json.decode(response.body) as List<dynamic>;
      return Joke.fromJson(jokeList[0]);
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
