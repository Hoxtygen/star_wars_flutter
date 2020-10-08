import 'package:flutter/material.dart';
import 'package:star_wars_flutter/screens/home_screen.dart';



class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Star Wars Home"),
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/starwars.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: BoxConstraints.expand(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to the star wars character home",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyHomePage(title: "Never say Never");
                        }));
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Explore Characters".toUpperCase(),
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
