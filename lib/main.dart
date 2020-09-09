import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_flutter/character.dart';
import 'character.dart';
import 'character_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Star Wars Character'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Character myCharacter = Character();
  Future<Character> futureCharacter;

  void initState() {
    super.initState();
    futureCharacter = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Container(
            child: FutureBuilder<Character>(
              future: futureCharacter,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(snapshot.data.name),
                      Text(snapshot.data.gender),
                      Text("Features"),
                      Text(snapshot.data.height),
                      Text(snapshot.data.mass),
                      Text(snapshot.data.hairColor),
                      Text(snapshot.data.skinColor),
                      Text(snapshot.data.homeWorld),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}
