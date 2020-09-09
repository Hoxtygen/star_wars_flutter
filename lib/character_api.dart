import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character.dart';

Future<Character> fetchAlbum() async {
  final response = await http.get('https://swapi.dev/api/people/1/');

  if (response.statusCode == 200) {
    // print(response.body);
    print(json.decode(response.body));
    return Character.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load character');
  }
}
