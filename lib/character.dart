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
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      homeWorld: json['homeworld'],
    );
  }
}
