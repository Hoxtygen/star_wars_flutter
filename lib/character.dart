import 'package:http/http.dart' as http;
import 'dart:convert';

class Character {
  final String name;
  final String gender;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String homeWorld;

  Character(
      {this.name,
      this.gender,
      this.height,
      this.mass,
      this.hairColor,
      this.skinColor,
      this.homeWorld});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      gender: json['gender'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hairColor'],
      skinColor: json['skinColor'],
      homeWorld: json['homeWorld'],
    );
  }

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
}
