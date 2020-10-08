import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character.dart';


Future<Character> getCharacter(url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Character.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load character');
  }
}