import 'package:flutter/material.dart';
import 'package:star_wars_flutter/utilities/style_constants.dart';
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
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/starwars-tros.jpg"),
        fit: BoxFit.cover,
      ),
    ),
     constraints: BoxConstraints.expand(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Name",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.name}",
              style: kCharacterDataStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Gender",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.gender}",
              style: kCharacterDataStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Height",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.height}",
              style: kCharacterDataStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Mass",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.mass}",
              style: kCharacterDataStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Skin Color",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.skinColor}",
              style: kCharacterDataStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Hair Color",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.hairColor}",
              style: kCharacterDataStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Birth Year",
              style: kCharacterTitleStyle,
            ),
            Text(
              "${data.birthYear}",
              style: kCharacterDataStyle,
            )
          ],
        )
      ],
    ),
  );
}
