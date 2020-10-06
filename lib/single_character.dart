import 'package:flutter/material.dart';
import 'character.dart';
import 'people_api.dart';

class FullCharacter extends StatefulWidget {
  FullCharacter({this.characterUrl, this.characterName});
  final String characterUrl;
  final String characterName;
  @override
  _FullCharacterState createState() => _FullCharacterState();
}

class _FullCharacterState extends State<FullCharacter> {
  Future<Character> futureCharacter;
  String url;
  String name;
  @override
  void initState() {
    super.initState();
    updateInfo(widget.characterUrl, widget.characterName);
    futureCharacter = getCharacter(widget.characterUrl);
  }

  void updateInfo(String characterUrl, String characterName) {
    setState(() {
      if (characterUrl == null) {
        url = "Cannot get url data";
        return;
      }

      if (characterName == null) {
        name = "Cannot get character name";
        return;
      }
      // url = characterInfo["url"];
      url = characterUrl;
      name = characterName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<Character>(
          future: futureCharacter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return single(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

single(data) {
  return Column(
    children: [
      Text("Name: ${data.name}"),
      Text("Gender: ${data.gender}"),
      Text("Height: ${data.height}"),
      Text("Mass: ${data.mass}"),
      Text("Skin Color: ${data.skinColor}"),
      Text("Hair Color: ${data.hairColor}"),
      Text("Birth Year: ${data.birthYear}"),
    ],
  );
}
