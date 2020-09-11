import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character.dart';

Future<List<Character>> getCharacters() async {
  final response = await http.get('https://swapi.dev/api/people/');

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    List data = json["results"];
    return data.map((character) => new Character.fromJson(character)).toList();
  } else {
    throw Exception('Failed to load character');
  }
}
