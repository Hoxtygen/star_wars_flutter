import 'package:flutter/material.dart';
import 'package:star_wars_flutter/single_character.dart';
import '../character.dart';
import '../character_api.dart';
import 'package:star_wars_flutter/character.dart';
import '../reusable_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Character> futureCharacter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _charactersData(),
              ),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      print("You clicked previous");
                    },
                    child: Text("Previous"),
                  ),
                  FlatButton(
                    onPressed: () {
                      print("You clicked next");
                    },
                    child: Text("Next"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

FutureBuilder _charactersData() {
  return FutureBuilder<List<Character>>(
    future: getCharacters(),
    builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
      if (snapshot.hasData) {
        List<Character> data = snapshot.data;
        return _characters(data);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

ListView _characters(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: SingleCard(
            name: data[index].name,
            gender: data[index].gender,
            // characterInfo: data,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FullCharacter(
                    characterUrl: data[index].url,
                    characterName: data[index].name,
                  );
                },
              ));
            },
          ),
        );
      });
}

/* ListTile _tile(String name, String gender, IconData icon) {
  return ListTile(
    title: Text(name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(gender),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
} */
