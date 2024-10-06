import 'package:daily_hogwarts/core/api/api_client.dart';
import 'package:daily_hogwarts/core/data/character_model.dart';
import 'package:dio/dio.dart';

class CharactersRepository {
  final Dio _client;

  CharactersRepository() : _client = ApiClient.getInstance();

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await _client.get('characters');

      switch (response.statusCode) {
        case 200:
          return (response.data as List)
              .map((json) => Character.fromJson(json))
              .toList();
        case 404:
          throw Exception(
            'Characters not found',
          );
        case 500:
          throw Exception(
            'Server error. Please try again later.',
          );
        default:
          throw Exception(
            'Unexpected error occurred: ${response.statusCode}',
          );
      }
    } catch (e) {
      throw Exception(
        'Failed to load characters: $e',
      );
    }
  }

  Future<Character> getCharacterById(String id) async {
    try {
      final response = await _client.get('character/$id');

      switch (response.statusCode) {
        case 200:
          return response.data.map((json) => Character.fromJson(json)).toList()[
              0]; // * BE implementation with returning an array with one object inside
        case 404:
          throw Exception(
            'Character not found. Please check the ID.',
          );
        case 500:
          throw Exception(
            'Server error. Please try again later.',
          );
        default:
          throw Exception(
            'Unexpected error occurred: ${response.statusCode}',
          );
      }
    } catch (e) {
      throw Exception(
        'Failed to load character: $e',
      );
    }
  }
}
