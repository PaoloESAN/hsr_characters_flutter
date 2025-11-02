import 'dart:convert';
import 'package:http/http.dart' as http;

class Character {
  final int id;
  final String name;
  final int rarity;
  final String path;
  final String element;
  final DateTime release;
  final String description;
  final String imageUrl;

  Character({
    required this.id,
    required this.name,
    required this.rarity,
    required this.path,
    required this.element,
    required this.release,
    required this.description,
    required this.imageUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      rarity: json['rarity'],
      path: json['path'],
      element: json['element'],
      release: DateTime.parse(json['release']),
      description: json['introduction'],
      imageUrl: json['img'],
    );
  }
}

class CallApi {
  static const String baseUrl =
      'https://api.allorigins.win/raw?url=https://hsr-api.vercel.app/api/v1/characters';

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Error status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Fallo al cargar personajes: $e');
    }
  }
}
